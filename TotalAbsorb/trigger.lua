function(event_name, ...)
    -- Do we even need this? Surely this function only fires whenever any of the events below occur
    if event_name == "PLAYER_REGEN_DISABLED" or event_name == "UNIT_ABSORB_AMOUNT_CHANGED" or event_name == "UNIT_HEALTH" then
        return true
    end
    return false -- This shouldn't happen, no?
end

