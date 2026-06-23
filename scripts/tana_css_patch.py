#!/usr/bin/env python3
import re
from pathlib import Path
from typing import Optional

PRELOAD_FILE = Path("/Applications/Tana Outliner.app/Contents/Resources/app/build/preload.js")
CSS_ID = "__custom_css__"
START_MARKER = "/* TANA_CUSTOM_CSS_START */"
END_MARKER = "/* TANA_CUSTOM_CSS_END */"

CSS_STYLES_RAW = """
html {
    --fontStackNormal: '方正悠宋+ GBK', IBM Plex Sans, Source Han Sans SC VF, Ping Fang SC, sans-serif !important;
    --fontStackNormalVariable: '方正悠宋+ GBK', IBM Plex Sans, Source Han Sans SC VF, Ping Fang SC, sans-serif !important;
    --fontStackMonospace: '0xProto Nerd Font', Google Sans Code, IBM Plex Mono, Source Han Sans SC VF, Ping Fang SC, monospace !important;
    --baseFontSize: 17px !important;
}
body {
    font-weight: 500;
}
div.itemdone-checkbox span.editable {
    text-decoration: line-through;
}
"""


def minify_css(css: str) -> str:
    s = re.sub(r'/\*.*?\*/', '', css, flags=re.DOTALL)
    s = re.sub(r'\s+', ' ', s)
    s = re.sub(r'\s*([{}:;,])\s*', r'\1', s)
    return s.strip()


CSS_STYLES = minify_css(CSS_STYLES_RAW)


def build_inject_code() -> str:
    js_code = (
        f';window.addEventListener("DOMContentLoaded",function(){{'
        f'try{{'
        f'if(document.getElementById("{CSS_ID}"))return;'
        f'var s=document.createElement("style");'
        f's.id="{CSS_ID}";'
        f's.textContent="{CSS_STYLES}";'
        f'document.head.appendChild(s)'
        f'}}catch(e){{}}'
        f'}})();'
    )
    return f"{START_MARKER}\n{js_code}\n{END_MARKER}"


def extract_existing_css(content: str) -> Optional[str]:
    start_idx = content.find(START_MARKER)
    end_idx = content.find(END_MARKER)
    if start_idx == -1 or end_idx == -1:
        return None
    section = content[start_idx:end_idx]
    match = re.search(r'textContent="([^"]*)"', section)
    return match.group(1) if match else ""


def patch_file():
    if not PRELOAD_FILE.exists():
        print(f"❌ Error: {PRELOAD_FILE} not found")
        return

    content = PRELOAD_FILE.read_text()
    inject_code = build_inject_code()

    if START_MARKER in content:
        existing_css = extract_existing_css(content)
        if existing_css is None:
            print("❌ Error: Found start marker but not end marker")
            return

        if existing_css == CSS_STYLES:
            print("⚠️  Content unchanged, skipping.")
            return

        new_content = re.sub(
            re.escape(START_MARKER) + r".*?" + re.escape(END_MARKER),
            "",
            content,
            flags=re.DOTALL,
        )
        PRELOAD_FILE.write_text(new_content + inject_code)
        print(f"🔄 Content updated: {PRELOAD_FILE}")
    else:
        backup_file = PRELOAD_FILE.with_suffix(".js.bak")
        backup_file.write_text(content)
        PRELOAD_FILE.write_text(content + inject_code)
        print(f"✅ Patched: {PRELOAD_FILE}")
        print(f"🧾 Backup: {backup_file}")


def main():
    patch_file()


if __name__ == "__main__":
    main()
