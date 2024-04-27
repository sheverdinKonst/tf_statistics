#!/usr/bin/env lua

---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by sheverdin.
--- DateTime: 3/6/24 2:58 PM
---

local json          = require "luci.jsonc"
local tf            = require "tf_module"
local i2c           = require "i2c_module"

local sensorRes = {}

local hw_sysEnum = {
    main        = nil,
    sensors     = i2c.get_sensorsData(),
    ups         = nil,
    sht         = nil,
    sfp1        = nil,
    rtc         = nil,
    poe         = nil,
    system      = nil,
    autorestart = nil,
}

local methods = {
    getStatus = {
        args = { category = "string", param = "string" },
        call = function(f_args)
            local cmdtype = " get"

            --      for i, j in pairs(tf_sensors.hwSensorEnum) do
            --      cmd = ""
            --      cmd = "hwsys_ctrl " .. tf_sensors.hwSensorEnum[i][2] .. cmdtype
            --     local temp = tostring(tf.executeCommand(cmd))
            --     temp = string.sub(temp, 1, #temp - 1)
            --     local key  = tf_sensors.hwSensorEnum[i][1]
            --     sensorRes[key] = temp
            -- end

            if f_args.category ~= nil then
                -- ubus call hw_sensor getStatus '{"category":"ups"}'
                if hw_sysEnum[f_args.category] ~= nil then
                    for name, _ in pairs(hw_sysEnum[f_args.category]) do
                        cmd = "hwsys_ctrl " .. name .. cmdtype
                        local temp = tostring(tf.executeCommand(cmd))
                        temp = string.sub(temp, 1, #temp - 1)
                        sensorRes[name] = temp
                    end
                else
                    sensorRes["category"] = f_args.category
                    sensorRes["param"] = "null"
                end

            elseif f_args.param ~= nil then
                -- ubus call hw_sensor getStatus '{"param":"temper"}'
                cmd = "hwsys_ctrl " .. f_args.param .. cmdtype
                local temp = tostring(tf.executeCommand(cmd))
                temp = string.sub(temp, 1, #temp - 1)
                sensorRes[f_args.param] = temp
            else
                -- READ all data ubus call hw_sensor getStatus
                sensorRes["1"] = 1
                sensorRes["2"] = 2
            end

            return
                {
                    hw_sys = sensorRes
                }, 0
        end
    }
}

local function parseInput()
    local parse = json.new()
    local done, err

    while true do
        local chunk = io.read(4096)
        if not chunk then
            break
        elseif not done and not err then
            done, err = parse:parse(chunk)
        end
    end

    if not done then
        print(json.stringify({ error = err or "Incomplete input" }))
        os.exit(1)
    end

    return parse:get()
end

local function validateArgs(func, uargs)
    local method = methods[func]
    if not method then
        print(json.stringify({ error = "Method not found" }))
        os.exit(1)
    end

    if type(uargs) ~= "table" then
        print(json.stringify({ error = "1 Invalid arguments" }))
        os.exit(1)
    end

    uargs.ubus_rpc_session = nil

    local k, v
    local margs = method.args or {}
    for k, v in pairs(uargs) do
        if margs[k] == nil or
            (v ~= nil and type(v) ~= type(margs[k]))
        then
            print(json.stringify({ error = "2 Invalid arguments" }))
            os.exit(1)
        end
    end
    return method
end

if arg[1] == "list" then
    local _, method, rv = nil, nil, {}
    for _, method in pairs(methods) do
        rv[_] = method.args or {}
    end
    print((json.stringify(rv):gsub(":%[%]", ":{}")))
elseif arg[1] == "call" then
    local args = parseInput()
    local method = validateArgs(arg[2], args)
    local result, code = method.call(args)
    print((json.stringify(result):gsub("^%[%]$", "{}")))
    os.exit(code or 0)
end