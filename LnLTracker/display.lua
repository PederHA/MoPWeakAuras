function()
    local procs = WA_LNL_PROCS or 1 -- Avoid division by 0 error if we dip out of combat and counter resets
    local casts = WA_LNL_CASTS or 0    
    local cpp = 0

    
    WA_LNL_OUTSTR = "" -- Used for both WA text display and chat summary
    
    -- Procs
    if WA_LNL_SHOW_PROCS then
        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. "Procs:            " .. WA_LNL_PROCS .. "\n"
    end
    
    -- Casts
    if WA_LNL_SHOW_CASTS then
        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. "Casts:            " .. casts .. "\n"
    end
    
    -- Casts per Proc
    if WA_LNL_SHOW_CPP then
        if casts > 0 then
            cpp = (("%%.%df"):format(2)):format(casts / procs)
        end
        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. "Casts/Proc:     " .. cpp .. "\n"
    end
    
    -- Current Streak
    if WA_LNL_SHOW_STREAK then
        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. "Current streak: " .. WA_LNL_STREAK .. "\n"
    end
    
    -- Best Streak
    if WA_LNL_SHOW_BEST_STREAK then
        WA_LNL_OUTSTR = WA_LNL_OUTSTR .. "Best streak:     " .. WA_LNL_BEST_STREAK .. "\n"
    end 
    
    -- Title (Shown first)
    if WA_LNL_SHOW_TITLE then
        return WA_LNL_TITLE .. "\n" .. WA_LNL_OUTSTR
    else
        return WA_LNL_OUTSTR
    end
end

