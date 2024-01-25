
-- Receber o auto loot do cliente e enviar novamente para do servidor para o cliente --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 57 then
        onAutoLootChangeStatus(cid, buffer)
    end
    return true
end