function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 50 then
        local param = buffer:explode("@")
        local category = tostring(param[1])
        local numeration = tonumber(param[2])
        enterDungeon(cid, category, numeration)
    end
    return true
end