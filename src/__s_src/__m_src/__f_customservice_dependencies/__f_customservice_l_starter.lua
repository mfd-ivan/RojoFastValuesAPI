local __s_service = game:GetService("ServerScriptService")

local __r_storage = game:GetService("ReplicatedStorage")

local __src_lock = __s_service:WaitForChild("__src_lock")
local __m_src = __src_lock:WaitForChild("_m_src")

local __f_customservice_dependencies = __m_src:WaitForChild("__f_customservice_dependencies")
local __f_customservice_l = require(__f_customservice_dependencies:WaitForChild("__f_customservice_l"))

return function()
	__r_storage:WaitForChild("_gfv_event").OnServerInvoke = function(fromPlayer ,Cast, Type, fastValue, ValueToSet)
		if fromPlayer:GetRankInGroup(3532517) < 50 and Cast:lower() == "post" then
			return fromPlayer:Kick("Using fastvalues, lol, go apply for developer kid.")
		else
			__f_customservice_l(Cast, Type, fastValue, ValueToSet)
		end
	end
end