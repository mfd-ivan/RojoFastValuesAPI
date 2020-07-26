--!nocheck

--	// FileName: __f_customservice.lua
--	// Version: 2.5
--	// Written By: Aleksej Grasnich and Nikita Pedko
--	// Description: Main handler when using FastValues
--	// TODO:
--			Add support for DynamicValue and SynchedValues


-------------- SERVICES --------------
local __dss_service = game:GetService("DataStoreService")
local __http_service = game:GetService("HttpService")

-------------- STORAGE --------------
local __r_storage = game:GetService("ReplicatedStorage")

-------------- DATASTORES --------------
local __fflag_store = __dss_service:GetDataStore("__fvalue_gdatastore", "__fflag_store")
local __fstring_store = __dss_service:GetDataStore("__fvalue_gdatastore", "__fstring_store")
local __fnumber_store = __dss_service:GetDataStore("__fvalue_gdatastore", "__fnumber_store")
local __fdictionary_store = __dss_service:GetDataStore("__fvalue_gdatastore", "__fdictionary_store")

-------------- CONSTANTS --------------
local __fvalue_f_dict = {}

-------------- __fvalue_f_dict --------------
-- STATIC FLAGS
-- FASTFLAG
-- GET
function __fvalue_f_dict:GetFastFlag(FastFlag)
	if typeof(FastFlag) ~= "string" then
		return error("FastFlag searcher root must be a string!")
	end
	local FastFlagReturnedData = __fflag_store:GetAsync(FastFlag)
	if FastFlagReturnedData == nil then
		return error("FastFlag not found. Consider doing a DefineFastFlag(\""..FastFlag.."\", true or false).")
	end
	return FastFlagReturnedData
end
-- PUBLISH
function __fvalue_f_dict:DefineFastFlag(Name, Value)
	if typeof(Value) ~= "boolean" then
		return error("FastFlag is not a boolean, consider not using "..Value.." ("..typeof(Value)..")")
	end
	__fflag_store:SetAsync(Name, Value)
end

-- FASTSTRING
-- GET
function __fvalue_f_dict:GetFastString(FastString)
	if typeof(FastString) ~= "string" then
		return error("FastString searcher root must be a string!")
	end
	local FastStringReturnedData = __fstring_store:GetAsync(FastString)
	
	if FastStringReturnedData == nil then
		return error("FastString not found. Consider doing a DefineFastString(\""..FastString.."\", \" \").")
	end
	return FastStringReturnedData
end
-- PUBLISH
function __fvalue_f_dict:DefineFastString(Name, Value)
	if typeof(Value) ~= "string" then
		return error("FastString is not a string, consider not using "..Value.." ("..typeof(Value)..")")
	end
	__fstring_store:SetAsync(Name, Value)
end

-- FASTNUMBER
-- GET
function __fvalue_f_dict:GetFastNumber(FastNumber)
	if typeof(FastNumber) ~= "string" then
		return error("FastNumber searcher root must be a string!")
	end
	local FastNumberReturnedData = __fnumber_store:GetAsync(FastNumber)
	if FastNumberReturnedData == nil then
		return error("FastNumber not found. Consider doing a DefineFastNumber(\""..FastNumber.."\", 0).")
	end
	return FastNumberReturnedData
end
-- PUBLISH
function __fvalue_f_dict:DefineFastNumber(Name, Value)
	if typeof(Value) ~= "number" then
		return error("FastNumber is not a number, consider not using "..Value.." ("..typeof(Value)..")")
	end
	__fnumber_store:SetAsync(Name, Value)
end

-- FASTDICTIONARY
-- GET
function __fvalue_f_dict:GetFastDictionary(FastDictionary, ShowValues)
	if typeof(FastDictionary) ~= "string" then
		return error("FastDictionary searcher root must be a string!")
	end
	local FastDictionaryReturnedData = __fdictionary_store:GetAsync(FastDictionary)
	if FastDictionaryReturnedData == nil then
		return error("FastDictionary not found. Consider doing a DefineFastDictionary(\""..FastDictionary.."\", {}).")
	end	
	local DecodedFastDictionaryReturnedData = __http_service:JSONDecode(FastDictionaryReturnedData)
	if ShowValues then
		warn("Showing values of "..FastDictionary..":",#DecodedFastDictionaryReturnedData)
		for Key, Value in pairs(DecodedFastDictionaryReturnedData) do
			print(Key,"|",Value,"|",typeof(Value))
		end
		return FastDictionaryReturnedData
	end
	return FastDictionaryReturnedData
end
-- PUBLISH
function __fvalue_f_dict:DefineFastDictionary(Name, Value, Sort)
	if typeof(Value) ~= "table" then
		return error("FastDictionary is not a table, consider not using "..tostring(Value).." ("..typeof(Value)..")")
	end
	if Sort then
		table.sort(Value)
	end
	__fdictionary_store:SetAsync(Name, __http_service:JSONEncode(Value))
end
return __fvalue_f_dict