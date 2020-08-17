function()
    for i = 1, 5 do
        if UnitIsUnit("target", "boss"..i) then
            return false
        end
    end
    return true
end
