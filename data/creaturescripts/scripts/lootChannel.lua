function onChannelJoin(cid, channelId, users)
	if(channelId ~= 21) then
		return true
	end
	setPlayerStorageValue(cid, "lootch", 1)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você abriu o canal de Loot, as menssagens de drop agora serão mostradas lá.")
	return true
end

function onChannelLeave(cid, channelId, users)
	if(channelId ~= 21) then
		return true
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você fechou o canal de Loot. As menssagens de drop agora retornarão para o Server Log.")
	setPlayerStorageValue(cid, "lootch", -1)

	return true
end