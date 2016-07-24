-- تعریف کردن ایمپورت
local function parsed_url(link)
  local parsed_link = URL.parse(link)
  local parsed_path = URL.parse_path(parsed_link.path)
  return parsed_path[2]
end

-- تعریف کردن ریلود
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function reload_plugins( )
	plugins = {}
  return load_plugins()
end

local function run(msg,matches)
 -- مارکرید خاموش روشن
    if matches[1] == "markread" then
    	if matches[2] == "on" then
    		redis:set("bot:markread", "on")
    		return "Mark read > on"
    	end
    	if matches[2] == "off" then
    		redis:del("bot:markread")
    		return "Mark read > off"
    	end
    	return
    end
	--پاک کردن خاموش روشن
	    if matches[1] == "delete" then
    	if matches[2] == "on" then
    		redis:set("bot:del", "on")
    		return "Bot will delete Files"
    	end
    	if matches[2] == "off" then
    		redis:del("bot:del")
    		return "Bot wont delete Files"
    	end
    	return
    end
	--پلاگین کنترل روشنی یا خاموشی
    if matches[1] == "bot" then
    	if matches[2] == "on" then
    		redis:set("bot:turnon", "on")
    		return "bot is > on"
    	end
    	if matches[2] == "off" then
    		redis:del("bot:turnon")
    		return "bot is > off"
    	end
    	return
    end
	--plugin off on
	function run(msg, matches)
	local mamali = 'killall tmux'
					if redis:del('bot:turnon') then
		return io.popen('uptime'):read('*all')
		elseif  redis:get('bot:turnon')  then
		return 'ok'
	end
		end
	-- پیام فرستادن
    if matches[1] == "pm" then
    	local text = "Message From "..(msg.from.username or msg.from.last_name).."\n\nMessage : "..matches[3]
    	send_large_msg("user#id"..matches[2],text)
    	return "Message has been sent"
    end
	-- پلاگین ایمپورت
    if matches[1] == "import" then--join by group link
    	local hash = parsed_url(matches[2])
    	import_chat_link(hash,ok_cb,false)
    end
	--ریلود
		if matches[1] == 'reload' then
		receiver = get_receiver(msg)
		reload_plugins(true)
		post_msg(receiver, "Reloaded!", ok_cb, false)
		return "Reloaded!"
	end
	--setting bot name
	if matches[1] == "setbotname" and is_sudo(msg) then
    	set_profile_name(matches[1],ok_cb,false)
    end
--استاتوس دیلیت
	            local status = 'bot:del'
				    if matches[1] == "status" then
            local status1 = redis:get(status)
            if not status1 then
            return 'Now,Files Be Deleted'
            else
            return "Now,Files Be Deleted"
            end
        end
		--استاتوس مارکرید
        local status2 = 'bot:markread'
	    if matches[1] == "statusm" then
            local statusm1 = redis:get(status2)
            if not statusm1 then
            return 'Now,MarkRead Is Off'
            else
            return "Now,MarkRead Is On"
            end
        end
    
    return
end

return {
  patterns = {
	"^[#!/](markread) (on)$",
	"^[#!/](markread) (off)$",
	"^[#!/](delete) (on)$",
	"^[#!/](delete) (off)$",
	"^[#!/](bot) (on)$",
	"^[#!/](bot) (off)$",
	"^[!/](setbotname) (.*)$",
	"^[#/!](reload)$",
	"^[#/!](status)$",
	"^[#/!](statusm)$"
  },
  run = run,
}
