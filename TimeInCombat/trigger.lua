-- Event(s): PLAYER_REGEN_DISABLED, PLAYER_REGEN_ENABLED, WA_DELAYED_PLAYER_ENTERING_WORLD

function(event_name, ...)
    -- Init display upon entering combat
    if event_name == "PLAYER_REGEN_DISABLED" then
        WA_TIC_COMBAT = true
        WA_TIC_START_TIME = GetTime()
    elseif event_name == "PLAYER_REGEN_ENABLED" then
        WA_TIC_COMBAT = false
    end
    return true
end
