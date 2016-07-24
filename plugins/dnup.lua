local function run(msg, matches)
  local receiver = get_receiver(msg)
  local url = matches[1]
  local ext = matches[2]
  local file = download_to_file(url)
 local size = gethttpsize(matches[1])
  local cb_extra = {file_path=file}
  local dick =  'File Was Uploaded To Our Server\nSending To Telegram May Takes Some Minutes...\nSome Info:\nSize: '..nicesize(tonumber(size))..'\nType: '..ext..'\nURL: '..url
  local mime_type = mimetype.get_content_type_no_sub(ext)
  if ext == 'gif' then
  
    print('send_file')
			send_msg(receiver, dick, ok_cb, nil)
    send_document(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'text' then
    print('send_document')
			send_msg(receiver, dick, ok_cb, nil)
    send_document(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'image' then
    print('send_photo')
			send_msg(receiver, dick, ok_cb, nil)
    send_photo(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'audio' then
    print('send_audio')
			send_msg(receiver, dick, ok_cb, nil)
    send_audio(receiver, file, rmtmp_cb, cb_extra)

  elseif mime_type == 'video' then
    print('send_video')
			send_msg(receiver, dick, ok_cb, nil)
    send_video(receiver, file, rmtmp_cb, cb_extra)

  else
    print('send_file')
				send_msg(receiver, other, ok_cb, nil)
		send_msg(receiver, dick, ok_cb, nil)
    send_file(receiver, file, rmtmp_cb, cb_extra)

end
end
return {
  description = "When user sends media URL (ends with gif, mp4, pdf, etc.) download and send it to origin.", 
  usage = "",
  patterns = {
    "(https?://[%w-_%.%?%.:/%+=&]+%.(.*))$",
	

	
  }, 
  run = run 
}