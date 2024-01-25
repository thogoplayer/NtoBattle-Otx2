function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 48 then
        local param = buffer:explode("@")
        local name = tostring(param[1])
        acceptPlayerDungeon(cid, name)
    end
    return true
end