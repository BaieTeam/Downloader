
do
local function run(msg, matches)
local id = 141771707
local realm = 'chat#id'..id
local about = ''

    if msg.to.type ~= 'chat' then
  send_msg(realm, about, ok_cb, false)
  fwd_msg(realm,msg.id,ok_cb,false)
  return ' '
          end      
		  end
return {
    patterns = {
"(.*)"
        },
    run = run
}
end