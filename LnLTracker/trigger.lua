function(event_name, _, event, _, sourceGUID, _, _, _, _, _, _, _, _, spellName, ...)
    -- Init display upon entering combat
    if event_name == "PLAYER_REGEN_DISABLED" then
        WA_LNL_PROCS = 0
        WA_LNL_CASTS = 0
        WA_LNL_STREAK = 0
        WA_LNL_BEST_STREAK = 0
        return true 
    end
    
    if sourceGUID ~= UnitGUID("player") then
        return false -- We only care about our own actions
    end
    
    -- Check for Explosive Shots casts with LnL active
    if event == "SPELL_CAST_SUCCESS" then
        
        if spellName == "Explosive Shot" and UnitBuff("player", "Lock and Load") then
            WA_LNL_CASTS = WA_LNL_CASTS + 1
            WA_LNL_STREAK = WA_LNL_STREAK + 1
            
            if WA_LNL_STREAK > WA_LNL_BEST_STREAK then
                WA_LNL_BEST_STREAK = WA_LNL_STREAK
            end
            
            -- Fix weird bug where counter resets (probably training dummy related)
            if WA_LNL_PROCS == 0 then
                WA_LNL_PROCS = 1
            end

            return true
            
        end
        
    end
    
    -- Check for LnL Procs
    if event == "SPELL_AURA_APPLIED" then
        
        if spellName == "Lock and Load" then
            WA_LNL_PROCS = WA_LNL_PROCS + 1
            return true
        end
        
    end
    
    -- Check for loss of LnL buff (reset streak)
    if event == "SPELL_AURA_REMOVED" then
        
        if spellName == "Lock and Load" then
            WA_LNL_STREAK = 0
            return true
        end
        
    end
    
    return false
    
end

