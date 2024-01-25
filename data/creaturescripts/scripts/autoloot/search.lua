
-- Pesquisa do Auto Loot --

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == 65 then
        local param = buffer:explode("@")
        local itemName = tostring(param[1])
        local category = tostring(param[2])

        doSendPlayerExtendedOpcode(cid, autoloot_send_destroyCHILD_opcode, "destroy".."@")
        onSearchAutoLootItem(cid, itemName, category)
    end
    return true
end