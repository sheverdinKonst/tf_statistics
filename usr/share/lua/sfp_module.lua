---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by sheverdin.
--- DateTime: 4/8/24 5:49 PM
---


local tf = require "tf_module"

local sfp_module = {}

local jsonInfo  = {}
local function getUbusData()
    jsonInfo = tf.collectJsonTable("ubus call sfp getStatus")
end

local sfpEnum = {
    present     = "present",          -- 2
    los         = "los",              -- 3
    vendor      = "vendor",           -- 4
    vendor_oui  = "vendor_oui",       -- 5
    vendor_pn   = "vendor_pn",        -- 6
    vendor_rev  = "vendor_rev",       -- 7
    temper      = "temper",           -- 8
    voltage     = "voltage",          -- 9
    tx_bias     = "tx_bias",          -- 10
    tx_power    = "tx_power",         -- 11
    identifier  = "identifier",       -- 12
    rx_power    = "rx_power",         -- 13
    connector   = "connector",        -- 14
    --nbr         = "nbr",            --
    --encoding    = "encoding",
    --media       = "media",
    --fiber_tec   = "fiber_tec",
    --link_len    = "link_len",
    --wavelen     = "wavelen",
    --speed       = "speed",
    --len50       = "len50",
    --len62       = "len62",
    --lenc        = "lenc",
    --type        = "type",
    --len9        = "len9",
}

local function get_sfp_present()

end

local function get_sfp_los()

end


local function get_sfp_vendor()

end

local function get_sfp_vendor_oui()

end

local function get_sfp_vendor_pn()

end

local function get_sfp_vendor_rev()

end


local function get_sfp_temper()

end

local function get_sfp_voltage()

end

local function get_sfp_tx_bias()

end

local function get_sfp_tx_power()

end

local function get_sfp_identifier()

end

local function get_sfp_rx_power()

end

local function get_sfp_connector()

end

local sfpFunc = {
    get_sfp_present,
    get_sfp_los,
    get_sfp_vendor,
    get_sfp_vendor_oui,
    get_sfp_vendor_pn,
    get_sfp_vendor_rev,
    get_sfp_temper,
    get_sfp_voltage,
    get_sfp_tx_bias,
    get_sfp_tx_power,
    get_sfp_identifier,
    get_sfp_rx_power,
    get_sfp_connector,
}

function get_sfpData(index)
    getUbusData()
    local upsData = ""
    index = tonumber(index)
    local key = sfpEnum[index][1]
    upsData = sfpFunc[index](index)
    return upsData
end

return sfp_module

