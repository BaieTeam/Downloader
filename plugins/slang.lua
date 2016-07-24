do
local function run(msg, matches)
local hash = 'lang:'..msg.from.id
if matches[1] == 'fa' and msg.to.type == 'user' then 
redis:set(hash , 'fa')
return [[سلام!

من Ultraking هستم

فقط لينک مورد نظر را بفرستيد و من ان را دانلود و برا شما ميفرستم!

براي خواندن قوانين به 

https://telegram.me/joinchat/BhviQz87RSFvOI2O00thOw

مراجعه کنيد]]
end
if matches[1] == 'en' and msg.to.type == 'user' then 
redis:set(hash , 'en')
       return [[ 
 Hi!
 Im UltraKing!
 Just Send Me Your Links And I Will Download And Send That!
 
 Check Out Rules In :
 https://telegram.me/joinchat/BhviQz87RSFvOI2O00thOw
]]end
if matches[1] == 'ar' and msg.to.type == 'user' then 
redis:set(hash , 'ar')
[[ Hi, Choose Your Lang 
سلام زبان خود را انتخاب کنيد
مرحبا، اختر لغتك

English 
 /en 
فارسي 
 /fa
عربي
/ar]]
end
local lang = redis:get(hash)
if not lang and msg.to.type == 'user' then 
return [[ Hi, Choose Your Lang 
سلام زبان خود را انتخاب کنيد
مرحبا، اختر لغتك

English 
 /en 
فارسي 
 /fa
عربي
/ar]]
end
end
local function run(msg, matches)
  local receiver = get_receiver(msg)
  local url = matches[1]
  local ext = matches[2]
  local file = download_to_file(url)
  local cb_extra = {file_path=file}
  local dick = 'File Was Uploaded To Our Server\n\nSending To Telegram May Takes Some Minutes...\nCheck Out Our Rules in \n https://telegram.me/joinchat/BhviQz87RSFvOI2O00thOw\n\n@UltraKing ❤️'
    local dick = 'در سرور ذخیره شد منتظر اپلود\n\nارسال به تلگرام چند دقیقه طول میکشد...\nقوانین در لینک زیر \n https://telegram.me/joinchat/BhviQz87RSFvOI2O00thOw\n\n@UltraKing ❤️'
  local dick = 'تم تحميل الملف الى خوادمنا\nارسال الملف الى التيليجرام يستغرق بعض الدقائق ...\nيمكنك تفقد\n القوانين و الاوامر هنا\nhttps://telegram.me/joinchat/BhviQz87RSFvOI2O00thOw\n@UltraKing ❤️'
  local mime_type = mimetype.get_content_type_no_sub(ext)
local hash = 'lang:'..msg.from.id
local lang = redis:get(hash)
if not lang and msg.to.type == 'user' then 
return [[ Hi, Choose Your Lang 
سلام زبان خود را انتخاب کنيد
مرحبا، اختر لغتك

English 
 /en 
فارسي 
 /fa
عربي
/ar]]
end
if redis:get(hash,'en')
  if ext == 'gif' then
    print('send_file')
    send_document(receiver, file, rmtmp_cb, cb_extra)
		reply_msg(receiver, dick, ok_cb, nil)

  elseif mime_type == 'text' then
    print('send_document')
    send_document(receiver, file, rmtmp_cb, cb_extra)
  		reply_msg(receiver, dick, ok_cb, nil)

  elseif mime_type == 'image' then
    print('send_photo')
    send_photo(receiver, file, rmtmp_cb, cb_extra)
  		reply_msg(receiver, dick, ok_cb, nil)

  elseif mime_type == 'audio' then
    print('send_audio')
    send_audio(receiver, file, rmtmp_cb, cb_extra)
  		reply_msg(receiver, dick, ok_cb, nil)

  elseif mime_type == 'video' then
    print('send_video')
    send_video(receiver, file, rmtmp_cb, cb_extra)
	reply_msg(receiver, dick, ok_cb, nil)

  else
    print('send_file')
    send_file(receiver, file, rmtmp_cb, cb_extra)
		send_msg(receiver, dick, ok_cb, nil)
		      send_api_msg(msg, get_receiver_api(msg), dick, true, 'html')
  end
  
end
end
return {
  patterns = {
  "^[#!/](en)$",
  "^[#!/](fa)$",
  "^[#!/](ar)$",
"(.*)",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(gif))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(mp4))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(pdf))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(ogg))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(zip))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(mp3))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(rar))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(wmv))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(doc))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(avi))$",
    "(https?://[%w-_%.%?%.:/%+=&]+%.(webp))$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.(exe))$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.(apk))$",
	"(https?://[%w-_%.%?%.:/%+=&]+%.(mkv)(.*))$"
  },
  run = run,
}
end