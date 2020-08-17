function()
    if WA_TIC_COMBAT then
        local time = GetTime() - WA_TIC_START_TIME
        local _,  decimals = strsplit(".", tostring(time), 2)
        
        if decimals then
            decimals = strsub(decimals, 1, 2)
        else
            decimals = "00"
        end
        
        return "Combat: " .. date("%M:%S", time) .. ":" .. strsub(decimals, 1, 2)     
    else
        return "Not In Combat"
    end
end
