#!/usr/bin/env python3

import os
import shutil

SRC_DIR = "/Applications/Tana.app/Contents/Resources/app/build/apps/electron/src"


def main():
    # Backup the original file
    shutil.copyfile(
        os.path.join(SRC_DIR, "Application.js"),
        os.path.join(SRC_DIR, "Application.js.bak"),
    )
    with open(os.path.join(SRC_DIR, "Application.js"), "r+") as f:
        lines = f.readlines()

    for i, line in enumerate(lines):
        if (
            line.strip()
            == "// Only quit application when main window is actually closed"
        ):
            print(lines[i + 1])
            print(lines[i + 2])
            print(lines[i + 3])
            print(lines[i + 4])
            print(lines[i + 5])


if __name__ == "__main__":
    main()
