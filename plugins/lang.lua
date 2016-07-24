local function run(msg, matches)
local lang = redis:get(hash)
local hash = 'lang:'..msg.from.id
if not lang then
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
return {
  patterns = {
    "^hi$",
	"^سلام$",
    "^درود$",
	"^salam$",
    "^slm$",
	"^[!/]start$",
	"^[!/]help$",
	"^hello$",
	"^مرحبا$",
	"^السلام$",
    "^hey$"
	}, 
  run = run 
}
