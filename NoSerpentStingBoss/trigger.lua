function()
    for i = 1, 5 do
        if UnitIsUnit("target", "boss"..i) then  -- check if target is a boss
            return true 
        end
    end
    return false
end
