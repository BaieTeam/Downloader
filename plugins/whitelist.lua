 do
function run(msg, matches)
if not is_sudo(msg) then
return nil
end
 local user_id = msg.id
      print('checking msg.id ----> '..user_id)
      print('checked.the truth id ----> '..user_id)
      return "\n\nThisًں”¼pm Id:"..msg.id
end

return {
    patterns = {
     "(.*)"
	 }, 
    run = run 
}

end