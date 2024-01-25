function onStepIn(cid, item, pos, fromPosition)
if not isPlayer(cid) then
	  return true
  end 
 local pos = getThingPos(cid)
 -- acesso hunts depois que ganhar
 if item.actionid == 16203 then 
  if getGlobalStorageValue(GGN_STATUS) == getPlayerGuildName(cid) then
   doSendMagicEffect(getThingPos(cid), 13)
   doSendAnimatedText(pos, "GGN", math.random(1, 255))
  elseif getGlobalStorageValue(GGN_STATUS) == -1 then
  doSendMagicEffect(getThingPos(cid), 2)
  doTeleportThing(cid, fromPosition, false)
  doPlayerSendCancel(cid, "[Guild Castle War] No momento não há guild domimante.")
  else
   doSendMagicEffect(getThingPos(cid), 2)
      doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[Guild Castle War] Você não pertence à guild "..getGlobalStorageValue(GGN_STATUS)..".")
  end
  return true
 end




 -- piso trono
if item.actionid == 16202 then 
	if getPlayerGuildId(cid) > 0 then
	local guildName = getPlayerGuildName(cid)
		if (getGlobalStorageValue(GGN_STATUS) ~= guildName) then
		doPlayerSendTextMessage(cid, 20, "[Guild Castle War] Você e sua guild estão no comando "..(getGlobalStorageValue(GGN_STATUS) ~= -1 and ", os antigos donos ["..tostring(getGlobalStorageValue(GGN_STATUS)).."] podem se vingar" or "").."!")
		setGlobalStorageValue(GGN_PREPARE1, -1)
		setGlobalStorageValue(GGN_PREPARE2, -1)
		setGlobalStorageValue(GGN_STATUS, guildName)
		setGlobalStorageValue(GGN_DOMAIN, guildName)
		-- doCastleRemoveEnemies()
		stopEvent(GGN_TIME_EVENT_ID_5)
		stopEvent(GGN_TIME_EVENT_ID_9)
		stopEvent(GGN_TIME_EVENT_ID_END)	
		end
		if (getGlobalStorageValue(GGN_DOMAIN) ~= guildName) then
		GGN_TIME_EVENT_ID_5 = addEvent(GGN_WARN_TIME, (GGNCONF.timeToGain/2) * TIME_MINUTES, guildName, (GGNCONF.timeToGain/2))
		GGN_TIME_EVENT_ID_9 = addEvent(GGN_WARN_TIME, (GGNCONF.timeToGain-1) * TIME_MINUTES, guildName, (GGNCONF.timeToGain-1))
		GGN_TIME_EVENT_ID_END = addEvent(GGN_CLOSE, GGNCONF.timeToGain * TIME_MINUTES, 2)
		doBroadcastMessage("[Guild Castle War] O jogador ["..getCreatureName(cid).."] e sua guild ["..guildName.."] estão no comando do castelo, vá dominar e impedir isso!")
		end
	else
	doSendMagicEffect(pos, 2)  
	doTeleportThing(cid, fromPosition, false)
	doPlayerSendCancel(cid, "[Guild Castle War] Você não possui uma guild.")
	end
return true
end




 -- aviso invasão area ggn
	if item.actionid == 16200 then
  if getPlayerGuildId(cid) > 0 then
   doSendAnimatedText(pos, "GGN", math.random(1, 255))
   if (getGlobalStorageValue(GGN_PREPARE1) ~= getPlayerGuildName(cid)) and ((getGlobalStorageValue(GGN_PREPARE2) ~= getPlayerGuildName(cid))) then
    setGlobalStorageValue(GGN_PREPARE1, getPlayerGuildName(cid))
    doBroadcastMessage("[Castle War] Atenção! A guild "..getPlayerGuildName(cid).." está tentando invadir o castelo, preparem-se!")
   end
  else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[Guild Castle War] Você não possui uma guild.")   
   return true
  end   
 end
 
  -- aviso invasão
 if item.actionid == 16204 then
  if getPlayerGuildId(cid) > 0 then
   doSendAnimatedText(pos, "GGN", math.random(1, 255))
   if (getGlobalStorageValue(GGN_PREPARE3) ~= getPlayerGuildName(cid)) and ((getGlobalStorageValue(GGN_PREPARE4) ~= getPlayerGuildName(cid))) then
    setGlobalStorageValue(GGN_PREPARE3, getPlayerGuildName(cid))
   end
  else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[Guild Castle War] Você não possui uma guild.")   
   return true
  end   
 end
  -- aviso invasão castelo
 if item.actionid == 16201 then
  doSendAnimatedText(pos, "GGN", math.random(1, 255))
  if (getGlobalStorageValue(GGN_PREPARE2) ~= getPlayerGuildName(cid)) then
   setGlobalStorageValue(GGN_PREPARE2, getPlayerGuildName(cid))
   doBroadcastMessage("[Guild Castle War] Atenção! A guild "..getPlayerGuildName(cid).." Invadiram o castelo, ataquem!")
  end
 end
 
 return true
end