
-- Receber o auto loot do cliente e enviar novamente para do servidor para o cliente --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 56 then
        onRemoveItemAutoLootList(cid, buffer)
    end
    return true
end