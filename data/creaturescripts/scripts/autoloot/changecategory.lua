
-- Receber o auto loot do cliente e enviar novamente para do servidor para o cliente --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 54 then
        onChangeCategory(cid, buffer)
    end
    return true
end