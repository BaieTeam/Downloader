do

function run(msg, matches)
  return [[ 
Hi, Choose Your Lang 
سلام زبان خود را انتخاب کنيد
مرحبا، اختر لغتك

English 
 /en 
فارسي 
 /fa
عربي
/ar
]]
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

end
