local function run(msg, matches)
local hash = 'something' 
if matches[1] == 'hset' then
redis:set(hash, matches[2])
return 'done' 
end
if matches[1] == 'hgetall'  then 
return serpent.block(redis:hgetall(hash),{comment=false}) 
end
end
return {
patterns = {
'/(hset) (.*)$',
'/(hgetall)$'
}, 
run = run 
}