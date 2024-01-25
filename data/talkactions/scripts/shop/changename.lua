
-- Mudar nome no SHOP --

function onSay(cid, words, param, channel)
	if param == "" then
		doPlayerSendTextMessage(cid, 22, "Nickname invalido.")
		return true
	end

	if getPlayerStorageValue(cid, 9492) <= 0 then
		return true
	end

	setPlayerStorageValue(cid, 9492, -1)
	
	local acc = getPlayerByGUID(cid)

	doRemoveCreature(cid)
	addEvent(function()
		db.executeQuery("UPDATE `players` SET `name` = '"..param.."' WHERE `id` = '"..acc.."';")
	end, 500)
	return true
end