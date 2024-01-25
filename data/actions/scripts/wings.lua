
-- Adicionar Wings ao Player --
local items = {
	[11131] = {wingsId = 1, wingsName = "Wings Red"},
	[19362] = {wingsId = 2, wingsName = "Wings Special"},
}

function onUse(cid, item)
	local wings_id = items[item.itemid]
	if not wings_id then
		print("Item com o ID: " .. item.itemid .. " nao registrado na tabela.")
		return true
	end
	
	doPlayerSendTextMessage(cid, 22, "Você ganhou a wings: " .. wings_id.wingsName)
	doPlayerAddWings(cid, wings_id.wingsId)
	doRemoveItem(item.uid, 1)
	return true
end