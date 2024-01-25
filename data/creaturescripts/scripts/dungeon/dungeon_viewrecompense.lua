function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 46 then
        local param = buffer:explode("@")
        local category = tostring(param[1])
        local numeration = tonumber(param[2])
        sendRecompenseToPlayer(cid, category, numeration)
    end
    return true
end