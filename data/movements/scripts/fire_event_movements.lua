function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then return true end
	if getPlayerAccess(cid) > 3 then return doTeleportThing(cid, Fire.teleport[2]) end
	if getPlayerLevel(cid) < Fire.minLevel then
		doTeleportThing(cid, fromPosition, true)
		doPlayerSendCancel(cid, "You need to be at least level " .. Fire.minLevel .. ".")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
		return true
	end
	if getGlobalStorageValue(Fire.storages[1]) <= Fire.players.max then
		doTeleportThing(cid, Fire.teleport[2])
		setGlobalStorageValue(Fire.storages[1], getGlobalStorageValue(Fire.storages[1])+1)
		doBroadcastMessage(getPlayerName(cid) .. " entered the fire stortm event! Currently " .. getGlobalStorageValue(Fire.storages[1]) .. " players have joined!", MESSAGE_STATUS_CONSOLE_RED)
		if getGlobalStorageValue(Fire.storages[1]) == Fire.players.max then
			setGlobalStorageValue(Fire.storages[1], getGlobalStorageValue(Fire.storages[1])+1)
			removeFireTp()
			doBroadcastMessage("The event will start on "..Fire.timeToStartEvent.." seconds. get ready!")
			addEvent(doFireInArea, Fire.timeToStartEvent*1000, 1)
		end 
	end
	return true
end