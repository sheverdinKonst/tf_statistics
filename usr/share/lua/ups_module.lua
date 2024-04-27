---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by sheverdin.
--- DateTime: 3/15/24 3:11 PM
---

local tf = require "tf_module"

local ups_module = {}
local jsonInfo   = {}

local function getUpsModeAvailable(index, name)
    tf.getUbusData(name)
    local upsData = ""
    local key = ups_module.upsEnum[index][1]
    local value = jsonInfo.ups_control[key]
    if tonumber(value) == 0 then
        upsData = "1"
    elseif tonumber(value) == 1 then
        upsData = "2"
    end
    return upsData
end

local function getUpsPwrSource(index, name)
    getUbusData(name)
    local upsData = ""
    local key = ups_module.upsEnum[index][1]
    local value = jsonInfo.ups_control[key]
    if tonumber(value) == 0 then
        upsData = "1"
    elseif tonumber(value) == 1 then
        upsData = "2"
    end
    return upsData
end

local function getUpsBatteryVoltage(index, name)
    getUbusData(name)
    local upsData = ""
    local key = ups_module.upsEnum[index][1]
    upsData = jsonInfo.ups_control[key]
    return upsData
end


local function getBatteryTime(index, name)
    getUbusData(name)
    local upsData = ""
    local key = ups_module.upsEnum[index][1]
    upsData = jsonInfo.ups_control[key]
    return upsData
end

ups_module.upsEnum = {
    upsModeAvalible   = getUpsModeAvailable,
    upsPwrSource      = getUpsPwrSource,
    upsBatteryVoltage = getUpsBatteryVoltage,
    upsBatteryTime    = getBatteryTime,
}

function ups_module.getUpsData(index, name)
    local res = sensor_module.sensorEnum[name]()
end

return ups_module