function()
    local abs = UnitGetTotalAbsorbs("player")
    local outstr = WA_TA_PREV_FMT or "0"
    
    -- Small optimization here. If absorb value is equal to previous absorb value,
    -- we can just use the formatted string we created when triggered previously.
    if abs ~= WA_TA_PREV_RAW then
        WA_TA_PREV_RAW = abs
        if abs >= 1e9 then
            outstr = ("%.1fb"):format(v / 1e9):gsub("%.?0+([kmb])$", "%1") -- Billion shield is unlikely
        elseif abs >= 1e6 then
            outstr = ("%.1fm"):format(v / 1e6):gsub("%.?0+([kmb])$", "%1")
        elseif abs >= 1e3 or v <= -1e3 then 
            outstr = ("%.1fk"):format(math.floor(v / 1e3)):gsub("%.?0+([kmb])$", "%1")
        end
        WA_TA_PREV_FMT = outstr
    end
    
    return "Total Absorb: ".. outstr
end
























