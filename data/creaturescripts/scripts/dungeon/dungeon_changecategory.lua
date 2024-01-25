function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 45 then
        local param = buffer:explode("@")
        local category = tostring(param[1])
        changeDungeonCategory(cid, category)
    end
    return true
end