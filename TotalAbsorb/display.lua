function()
    local absorb = UnitGetTotalAbsorbs("player")
    local outstr = "0"
    
    -- Show total absorb as an absolute value
    if absorb >= 1e9 then
        outstr = ("%.1fb"):format(absorb / 1e9):gsub("%.?0+([kmb])$", "%1") -- Billion shield is unlikely
    elseif absorb >= 1e6 then
        outstr = ("%.1fm"):format(absorb / 1e6):gsub("%.?0+([kmb])$", "%1")
    elseif absorb >= 1e3 or absorb <= -1e3 then 
        outstr = ("%.1fk"):format(math.floor(absorb / 1e3)):gsub("%.?0+([kmb])$", "%1")
    end
    
    -- Show current health + absorb relative to max health as a percentage value
    if WA_TA_SHOW_PERCENT then
        local absorbPercent = ((UnitHealth("player") + absorb) / UnitHealthMax("player")) * 100
        outstr = outstr .. " (" .. ("%.1f"):format(absorbPercent) .. "%%)"
    end
    
    return "Absorb: ".. outstr
end
