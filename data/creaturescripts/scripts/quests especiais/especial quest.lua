local config = {

	str = 123123123, -- Global storage
	tempo = 5, -- Tempo para criar os monstros novamente
	itemID = 5741, -- ID do item a ser movido
	tileAID = 1231, -- Actionid do tile em que o item está
	monster = {"kioji", "kioji", "kioji", "unknow", "unknow", "infernal demon"} -- Monstros
}

function onMoveItem(moveItem, fromPosition, position, cid)

	if (moveItem.itemid == config.itemID and getTileInfo(fromPosition).actionid == config.tileAID and getGlobalStorageValue(config.str) < os.time()) then
		for _, i in ipairs(config.monster) do
			doCreateMonster(i, fromPosition)
		end
		setGlobalStorageValue(config.str, os.time() + 30)
	end
	return true
end