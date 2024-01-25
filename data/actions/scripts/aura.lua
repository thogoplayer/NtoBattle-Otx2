
-- Adicionar Aura ao Player --
local items = {
	[12071] = {auraId = 1, auraName = "Blue Aura"},
}

function onUse(cid, item)
	local aura_id = items[item.itemid]
	if not aura_id then
		print("Item com o ID: " .. item.itemid .. " nao registrado na tabela.")
		return true
	end
	
	doPlayerSendTextMessage(cid, 22, "Você ganhou a aura: " .. aura_id.auraName)
	doPlayerAddAura(cid, aura_id.auraId)
	doRemoveItem(item.uid, 1)
	return true
end