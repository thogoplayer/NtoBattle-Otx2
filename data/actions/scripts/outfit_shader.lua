
-- Adicionar Outfit Shader ao Player --
local items = {
	[19366] = {shaderId = 1, shaderName = "Outfit Rainbow"},
	[19365] = {shaderId = 2, shaderName = "Outfit Heat"},
	[19364] = {shaderId = 3, shaderName = "Outfit Party"},
}

function onUse(cid, item)
	local shader_id = items[item.itemid]
	if not shader_id then
		print("Item com o ID: " .. item.itemid .. " nao registrado na tabela.")
		return true
	end
	
	doPlayerSendTextMessage(cid, 22, "Você ganhou a outfit shader: " .. shader_id.shaderName)
	doPlayerAddShaderOutfit(cid, shader_id.shaderId)
	doRemoveItem(item.uid, 1)
	return true
end