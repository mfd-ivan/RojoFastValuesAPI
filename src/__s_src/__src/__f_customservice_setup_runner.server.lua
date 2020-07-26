--!nocheck

--	// FileName: __f_customservice_setup_runner.server.lua
--	// Version: 1.0
--	// Written By: Aleksej Grasnich
--	// Description: Sets up all file dependencies
--	// TODO:
--			

local __s_service = game:GetService("ServerScriptService")

local __r_storage = game:GetService("ReplicatedStorage")

if script.Parent ~= __s_service:WaitForChild("__src_lock") then
    script.Parent = __s_service:WaitForChild("__src_lock")
end

if __s_service.__src_lock.__m_src["__f_customservice"] == nil then
    for _, v in ipairs(game:GetDescendants()) do
        if v.Name == "__f_customservice" and v:IsA("ModuleScript") then
            v.Parent = __s_service:WaitForChild("__src_lock"):WaitForChild("__m_src");
        else
            return error("Couldn't find _f_customservice.")
        end
    end
end

local this = __s_service:WaitForChild("__src_lock"):WaitForChild("__m_src");
local _f_customservice_dependencies = this:WaitForChild("__f_customservice_dependencies")

local __gfv_event = Instance.new("RemoteFunction", __r_storage)
__gfv_event.Name = "__gfv_event"

local __fsi_f = Instance.new("Folder", _f_customservice_dependencies)
__fsi_f.Name = "__fsi_f"

local Link = Instance.new("StringValue", _f_customservice_dependencies)
Link.Name = "https://devforum.roblox.com/t/fastvalueservice/"

local Credit = Instance.new("StringValue", __fsi_f)
Credit.Name = "Credit"
Credit.Value = "Aleksej Nikolaevich Grasnich, Nikita Nikolaevich Pedko, Ivan Ivanovich Gregrovnich"

local LastUpdateDate = Instance.new("StringValue", __fsi_f)
LastUpdateDate.Name = "LastUpdate"
LastUpdateDate.Value = "25/07/2020 05:04.123 UTC+9"

local Version = Instance.new("IntValue", __fsi_f)
Version.Name = "Version"
Version.Value = 4

local DevforumLink = Instance.new("StringValue", __fsi_f)
DevforumLink.Name = "DevforumLink"
DevforumLink.Value = "https://devforum.roblox.com/t/fastvalueservice/"


script:Destroy()