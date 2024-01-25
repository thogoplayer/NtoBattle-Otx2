function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 47 then
        local param = buffer:explode("@")
        local player = tostring(param[1])
        sendInviteToPlayer(cid, player)
    end
    return true
end