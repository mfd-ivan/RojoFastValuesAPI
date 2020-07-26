-- !! Migrated to __m_src: 10/07/2020

--	// Name: __server.server.lua
--	// Version: 2.2
--	// Written By: Ivan Ivanovich Gregrovnich and Aleksej Nikolaevich Grasnich
--	// Description: Managing server
--  // TODO:
--          Migrate to Rojo

-------------- SERVICES --------------
local __r_service = game:GetService("RunService"); -- Used to detect if IsStudio is true, just so no errors will occur
local __s_service = game:GetService("ServerScriptService"); -- Container for __src_lock

-------------- STORAGE --------------
local __r_storage = game:GetService("ReplicatedStorage");

-------------- FOLDERS --------------
local __m_src = __s_service:WaitForChild("__src_lock"):WaitForChild("__m_src");

-------------- __m_src --------------
-- ~ $__m_src.rbxm
local __f_customservice = require(__m_src:WaitForChild("__f_customservice"));
require(__m_src.__f_customservice_dependencies:WaitForChild("__f_customservice_l"));

local __s_en = RunService:IsStudio();

if __s_en then 
	return warn("Not getting __f_customservice due to testing in studio, please run on an open client.")
else
    -- Do your serverside code here
end