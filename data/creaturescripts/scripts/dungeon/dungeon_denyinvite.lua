function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 49 then
        local param = buffer:explode("@")
        local name = tostring(param[1])
        denyPlayerDungeon(cid, name)
    end
    return true
end