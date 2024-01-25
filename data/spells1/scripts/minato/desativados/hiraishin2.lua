local config = {
	storageID = 49609,
	mark_time = 6,
}

function onCastSpell(cid, var)
	--local target = getThingFromPosition(variantToPosition(var), 1)
	if getPlayerStorageValue (cid, config.storageID) == 1 then
		setPlayerStorageValue(cid, config.storageID, 2)
	else
		doPlayerSendTextMessage(cid,22, "Voce nao marcou nenhum jogador.")
		return false
	end

	return true
end