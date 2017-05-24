
function on_file_loaded(event)
	local title = mp.get_property('media-title')
	mp.commandv('show-text', title)
end

mp.register_event('file-loaded', on_file_loaded)
