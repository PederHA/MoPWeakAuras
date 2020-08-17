function()
    local currentTime = GetTime()
    local rate = WA_FPSMS_RATE or 1
    local lastUpdate = WA_FPSMS_LAST or 0
    local color = "|cFFFFFFFF"
    local goodColor = WA_FPSMS_GOOD_COLOR or color
    local medColor = WA_FPSMS_MED_COLOR or color
    local badColor = WA_FPSMS_BAD_COLOR or color
    local fpsHighThresh = WA_FPSMS_FPS_HIGH or 0
    local fpsMedThresh = WA_FPSMS_FPS_MEDIUM or 0
    local msHighThresh = WA_FPSMS_MS_HIGH or 0
    local msMedThresh = WA_FPSMS_MS_MEDIUM or 0

    
    -- Check if we should update the values in the display
    if currentTime - rate > lastUpdate then
        WA_FPSMS_FPS  = floor(GetFramerate())
        _, _, WA_FPSMS_MS, _ = GetNetStats()
        WA_FPSMS_LAST = currentTime
    end
    
    local fpsColor = color
    if WA_FPSMS_FPS  < fpsHighThresh then
        if WA_FPSMS_FPS < fpsMedThresh then
            fpsColor = badColor
        else
            fpsColor = medColor
        end
    else
        fpsColor = goodColor
    end

    local msColor = color
    if WA_FPSMS_MS > msMedThresh then
        if WA_FPSMS_MS > msHighThresh then
            msColor = badColor
        else
            msColor = medColor
        end
    else
        msColor = goodColor
    end
    
    
    return "FPS: " .. fpsColor ..floor(WA_FPSMS_FPS) .. color .. "  MS: " .. msColor .. WA_FPSMS_MS
end




















