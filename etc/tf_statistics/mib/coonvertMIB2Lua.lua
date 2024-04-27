---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by sheverdin.
--- DateTime: 4/11/24 11:27 AM
---
local dkjson = require("dkjson")

mib_json_path = "/home/sheverdin/Fort_Telecom/TFORTIS_APP/tf_statiscs/etc/tf_statistics/mib/FORT-TELECOM-MIB.json"

local mib_oid_array = {}
local mib_name_array = {}

keyList = {}

local mib_mainKey = {
    name      = "name",
    oid       = "oid",
    class     = "class",
    nodetype  = "nodetype",
    syntax    = "syntax",
    maxaccess = "maxaccess",
    status    = "status",
    description = "description",
    indices   = "indices",
    nodetype = "nodetype"
}

local isZero_list = {
    {"1.3.6.1.4.1.42019.3.2.2.1.1", "upsModeAvalible",     "isZero" },
    {"1.3.6.1.4.1.42019.3.2.2.1.2", "upsPwrSource",        "isZero" },
    {"1.3.6.1.4.1.42019.3.2.2.2.1.1.3", "inputState",     "isZero" },
    --{"1.3.6.1.4.1.42019.3.2.2.2.1.1.3.1", "inputTamper", "isZero" },
    --{"1.3.6.1.4.1.42019.3.2.2.2.1.1.3.1", "inputTamper", "isZero" },
    --{"1.3.6.1.4.1.42019.3.2.2.2.1.1.3.1", "inputTamper", "isZero" },
    {"1.3.6.1.4.1.42019.3.2.2.8.1", "sensorConnected",     "isZero" },
}

local ubusType_list_i2c = {
    { "1.3.6.1.4.1.42019.3.2.2.1.1",        "upsModeAvalible",     "i2c" },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.4",    "autoRstSpeedDown",    "i2c" },
    {"1.3.6.1.4.1.42019.3.2.2.7.1.1.1",     "portSfpIndex",        "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.7",    "portSfpRevision",     "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.9",    "portSfpVoltage",      "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.2",    "portSfpPresent",      "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.13",   "portSfpRxOutPower",   "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.8",    "portSfpTemperature",  "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.14",   "portSfpRxOutPowerDb", "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.10",   "portSfpBiasCurrent",  "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.3",    "portSfpSignalDetect", "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.5",    "portSfpOui",          "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.12",   "portSfpTxOutPowerDb", "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.6",    "portSfpPartNumber",   "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.7.1.1.4",    "portSfpVendor",       "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.8.3",        "sensorHumidity",      "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.8.2",        "sensorTemperature",   "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.2.1.1.3",    "inputState",          "i2c" },
    --{ "1.3.6.1.4.1.42019.3.2.2.2.1.1.3.1", "inputTamper",        "i2c" },
    --{ "1.3.6.1.4.1.42019.3.2.2.2.1.1.3.2", "inputSensor1",       "i2c" },
    --{ "1.3.6.1.4.1.42019.3.2.2.2.1.1.3.3", "inputSensor2",       "i2c" },
    --{ "1.3.6.1.4.1.42019.3.2.2.2.1.1.3.4", "inputRelay1",        "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.1.3",        "upsBatteryVoltage",   "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.1.4",        "upsBatteryTime",      "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.8.1",        "sensorConnected",     "i2c" },
    { "1.3.6.1.4.1.42019.3.2.2.1.2",        "upsPwrSource",        "i2c" },
}

local ubusType_poe_status = {
    { "1.3.6.1.4.1.42019.3.2.2.5.1.1.2", "portPoeStatusState", "poe_status" },
    { "1.3.6.1.4.1.42019.3.2.2.5.1.1.3", "portPoeStatusPower", "poe_status" }
}

local ubusType_poe_config = {
    { "1.3.6.1.4.1.42019.3.2.1.3.1.1.2", "portPoeState", "poe_config" },
}

local ubusType_ar_status = {
    { "1.3.6.1.4.1.42019.3.2.2.6.1.1.1.2", "arPortStatus", "ar_status" },
}

local ubusType_ar_config = {
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.4", "autoRstSpeedDown"      , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.7", "autoReStartTimeOnMin"  , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.9", "autoReStartTimeOffMin" , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.8", "autoReStartTimeOffHour", "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.3", "autoRstDstIP"          , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.2", "autoRstMode"           , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.6", "autoReStartTimeOnHour" , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.4", "autoRstSpeedDown"       , "ar_config"  },
    { "1.3.6.1.4.1.42019.3.2.1.2.1.1.5", "autoRstSpeedUp"        , "ar_config"  },
}

local ubus_typelist = {
    ubusType_ar_config,
    ubusType_ar_status,
    ubusType_poe_config,
    ubusType_poe_status,
    ubusType_list_i2c,
    isZero_list
}

function runCommand(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    --print(result)
    return result
end

function getJsonTable(ubusCmd)
    local ubusRes = runCommand(ubusCmd)
    local jsonData = dkjson.decode(ubusRes, 1)
    return jsonData
end

function countDots(str)
    local count = 0
    for char in str:gmatch(".") do
        if char == '.' then
            count = count + 1
        end
    end
    return count
end

local function get_oidArr(oid)
    local arr = {}
    local in_endIndex = string.len(oid)
    oid = string.sub(oid, 19, in_endIndex)
    for num in oid:gmatch("%d+") do
        table.insert(arr, tonumber(num))
    end
    return arr
end

local function getLuaStruct()
    local cmd = "cat " .. mib_json_path
    local mib_json = getJsonTable(cmd)
    local oid_arr = {}
    for key, value in pairs(mib_json) do
        --keyList[key] = key
        local mib_oid_struct = {}
        if value[mib_mainKey.oid] ~= nil then
            local mib_oid = value[mib_mainKey.oid]
            mib_oid_struct.name = value[mib_mainKey.name]
            mib_oid_struct.nodetype = value[mib_mainKey.nodetype]
            oid_arr = get_oidArr(value[mib_mainKey.oid])
            mib_oid_struct.oidLength = #oid_arr
            mib_oid_struct.i2c_addr = 0
            mib_oid_struct.isZero   = "no"
            mib_oid_struct.ubusType = "nd"
            if value[mib_mainKey.syntax] ~= nil then
                local syntax = {}
                --print(key .. "\t" .. value[mib_mainKey.oid])
                --print(value[mib_mainKey.name])
                --print("name Struct = " .. mib_main_struct.name)
                --mib_oid_struct.class       = value[mib_mainKey.class]
                --mib_oid_struct.nodetype    = value[mib_mainKey.nodetype]
                --mib_oid_struct.maxaccess   = value[mib_mainKey.maxaccess]
                --mib_oid_struct.description = value[mib_mainKey.description]


                --if mib_oid == "1.3.6.1.4.1.42019.3.2.2.2.1.1.3.1" then
                --print("___________________________ oid found !!!!")
                --end

                syntax = value[mib_mainKey.syntax]
                mib_oid_struct.valueType = syntax.type

                if (syntax.constraints ~= nil) then
                    local constraints = syntax.constraints
                    if (constraints.enumeration ~= nil) then
                        local enumeration = constraints.enumeration
                        mib_oid_struct.isEnum = "yes"
                        mib_oid_struct.Enum = enumeration
                    else
                        mib_oid_struct.isEnum = "no"
                        mib_oid_struct.Enum = nil
                    end
                end
            end
            if oid_arr[3] ~= 0 then
                mib_oid_array[mib_oid] = mib_oid_struct
            end
            --print("name from Array = " .. mib_array[value[mib_mainKey.oid]].name)
        end

        --print("------------------------")
    end
end

local function print_mib_main_array(oid)

    for i, j in pairs(mib_oid_array) do
        --if (i == "1.3.6.1.4.1.42019.3.2") then
        --    print("---------------------  1.3.6.1.4.1.42019.3.2 - found")
        --end

        print("\t[\"" .. i .. "\"] = ")
        print("\t{")
        for k, l in pairs(j) do
            if type(l) ~= "table" then
                print("\t\t" .. k .. " = \"" .. l .. "\",")
                if k == "isEnum" then
                    if l == "yes" then

                        print("\t\tenum  = {")
                        for e_key, e_value in pairs(j.Enum) do
                            print("\t\t\t" .. e_key .. " = \"" .. e_value .. "\",")
                        end
                        print("\t\t},")
                    end
                end
            end
        end
        print("\t},")
    end

    local oid_struct = {}
    -- oid_struct = mib_oid_array[oid]
    -- if oid_struct == nil then
    --     print("OID not found")
    -- else
    --     print("name = "         .. mib_oid_array[oid].name)
    --     -- print("class ="         .. mib_array[oid].class)
    --     -- print("nodetype = "     .. mib_array[oid].nodetype)
    --     -- print("valueType = "    .. mib_array[oid].valueType)
    --     -- print("maxaccess = "    .. mib_array[oid].maxaccess)
    --     -- print("description = "  .. mib_array[oid].description)
    --     -- print("Length  = "  .. mib_array[oid].oidLength)
    -- end
end

local function setDefaultParam()

    for _, value in pairs(ubusType_ar_config) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- ubusType_ar_config -- oid = " .. oid)
        else
            mib_oid_array[oid].ubusType = value[3]
        end
        --print("oid = " .. oid)
        --print("value[3] = " .. value[3])
        --print("ubusType = " .. mib_oid_array[oid].ubusType)
    end

    for _, value in pairs(ubusType_ar_status) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- ubusType_ar_status -- oid = " .. oid)
        else
            mib_oid_array[oid].ubusType = value[3]
        end
        --print("oid = " .. oid .. "  value[3] = " .. value[3] .. "  ubusType = " .. mib_oid_array[oid].ubusType)
    end

    for _, value in pairs(ubusType_poe_config) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- ubusType_poe_config -- oid = " .. oid)
        else
            mib_oid_array[oid].ubusType = value[3]
        end
        --print("oid = " .. oid .. "  value[3] = " .. value[3] .. "  ubusType = " .. mib_oid_array[oid].ubusType)
    end

    for _, value in pairs(ubusType_poe_status) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- ubusType_poe_status --  oid = " .. oid)
        else
            mib_oid_array[oid].ubusType = value[3]
        end
        --print("oid = " .. oid .. "  value[3] = " .. value[3] .. "  ubusType = " .. mib_oid_array[oid].ubusType)
    end

    for _, value in pairs(ubusType_list_i2c) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- ubusType_list_i2c --oid = " .. oid)
        else
            mib_oid_array[oid].ubusType = value[3]
        end
        -- print("oid = " .. oid .. "  value[3] = " .. value[3] .. "  ubusType = " .. mib_oid_array[oid].ubusType)
    end

    for _, value in pairs(isZero_list) do
        local oid = value[1]
        if (mib_oid_array[oid] == nili) then
            print("NULL obj -- isZero_list -- oid = " .. oid)
        else
            mib_oid_array[oid].isZero = value[3]
        end
        --print("oid = " .. oid .. "  value[3] = " .. value[3] .. "  isZero = " .. mib_oid_array[oid].isZero)
    end
end

function getMibTables()
    local cmd = "cat " .. mib_json_path
    local mib_json = getJsonTable(cmd)

    for key, value in pairs(mib_json) do
        local mib_oid_struct = {}
        if value[mib_mainKey.nodetype] == "table" then
            print("[\"" .. value[mib_mainKey.oid] .. "\"] = { \"" .. value[mib_mainKey.name] .. "\", nil }")
        end
    end
    print("***************************")

    --for key, value in pairs(mib_json) do
    --    if value[mib_mainKey.nodetype] == nil then
    --        local name = value[mib_mainKey.name]
    --        local oid = value[mib_mainKey.oid]
    --        if name ~= nil then
    --            print("name = " .. name)
    --        else
    --            print("Key = " .. key)
    --        end
    --        if (oid ~= nil) then
    --            print(" oid = " .. oid)
    --        end
    --    end
    --end
end

-- getMibTables()
getLuaStruct()
setDefaultParam()
print_mib_main_array()

