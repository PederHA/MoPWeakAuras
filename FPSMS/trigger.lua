function()
    local rate = WA_FPSMS_RATE or 1 -- Polling rate
    local currentTime = GetTime()        -- Current time (used for polling interval)
    local lastUpdate = WA_FPSMS_LAST_UPDATE or 0 -- Timestamp of last update
    
    -- Only update every N seconds (defined by WA_FPSMS_RATE)
    if currentTime - rate > lastUpdate then
        WA_FPSMS_FPS  = floor(GetFramerate())
        _, _, WA_FPSMS_MS, _ = GetNetStats()
        WA_FPSMS_LAST_UPDATE = currentTime
        return true -- Update display with new values
    end
    
    return false -- Don't update display
    
end
