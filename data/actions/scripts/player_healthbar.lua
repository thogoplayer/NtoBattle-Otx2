
-- Adicionar Health Bar ao Player --
local items = {
	[6541] = {healthBarId = 2, healthBarName = "fogo"},
	[6539] = {healthBarId = 3, healthBarName = "escuro"},
	[6543] = {healthBarId = 4, healthBarName = "rainbow"},
	[6542] = {healthBarId = 5, healthBarName = "ghost"},
	[6540] = {healthBarId = 6, healthBarName = "bow"},
	[18562] = {healthBarId = 7, healthBarName = "Akatsuki"},
	[19367] = {healthBarId = 8, healthBarName = "Darkness"},
	[19363] = {healthBarId = 9, healthBarName = "Party"},
	[18563] = {healthBarId = 10, healthBarName = "Kazekage"},
	[18564] = {healthBarId = 11, healthBarName = "Mizukage"},
	[18566] = {healthBarId = 12, healthBarName = "Tsuchikage"},
	[18567] = {healthBarId = 13, healthBarName = "Raikage"},
	[18568] = {healthBarId = 14, healthBarName = "Hokage"},
	[19368] = {healthBarId = 15, healthBarName = "Rikudou One"},
	[19370] = {healthBarId = 16, healthBarName = "Kurama"},
	[19369] = {healthBarId = 17, healthBarName = "Rikudou Two"},
	[19371] = {healthBarId = 18, healthBarName = "Chidori"},
}

function onUse(cid, item)
	local healthbar_id = items[item.itemid]
	if not healthbar_id then
		print("Item com o ID: " .. item.itemid .. " nao registrado na tabela.")
		return true
	end
	
	doPlayerSendTextMessage(cid, 22, "Voc� ganhou a healthbar: " .. healthbar_id.healthBarName)
	doPlayerAddHealthBackground(cid, healthbar_id.healthBarId)
	doRemoveItem(item.uid, 1)
	return true
end