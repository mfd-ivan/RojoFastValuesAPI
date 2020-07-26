local __s_service = game:GetService("ServerScriptService")

local __src_lock = __s_service:WaitForChild("__src_lock")
local __m_src = __src_lock:WaitForChild("__m_src")

local __f_customservice = require(__m_src:WaitForChild("__f_customservice"))

return function(fromPlayer, Cast, Type, fastValue, ValueToSet)
	if Type:lower() == "fastflag" then
		if Cast:lower() == "get" then
			return __f_customservice:GetFastFlag(fastValue)
		elseif Cast:lower() == "post" then
			if type(ValueToSet) ~= "boolean" then
				return error("Type set is not valid")
			else
				return __f_customservice:DefineFastFlag(fastValue, ValueToSet)
			end
		else
			return error("Cast is not valid!")
		end
	elseif Type:lower() == "faststring" then
		if Cast:lower() == "get" then
			return __f_customservice:GetFastString(fastValue)
		elseif Cast:lower() == "post" then
			if type(ValueToSet) ~= "string" then
				return error("Type set is not valid")
			else
				return __f_customservice:DefineFastString(fastValue, ValueToSet)
			end
		else
			return error("Cast is not valid")
		end
	elseif Type:lower() == "fastnumber" then
		if Cast:lower() == "get" then
			return __f_customservice:GetFastNumber(fastValue)
		elseif Cast:lower() == "post" then
			if type(ValueToSet) ~= "number" then
				return error("Type set is not valid")
			else
				return __f_customservice:DefineFastNumber(fastValue, ValueToSet)
			end
		else
			return error("Cast is not valid")
		end
	else
		return error(Type.." is not a valid FastValue type.")
	end
end