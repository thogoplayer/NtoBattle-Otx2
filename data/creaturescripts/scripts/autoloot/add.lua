
-- Receber o auto loot do cliente e enviar novamente para do servidor para o cliente --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 55 then
        onAddItemAutoLootList(cid, buffer)
    end
    return true
end