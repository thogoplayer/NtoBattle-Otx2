function onUse(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid,5009) == -1 then
    if getPlayerLevel(cid) >= 200 then
	doAddContainerItemRandom(cid, {14356,14326,14327,14328}, 0)
	doSendMagicEffect(getCreaturePosition(cid), 745,cid)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Uchiha Set Congratulations!\nyou received "..getPlayerStorageValue(cid, 942134).." in your rewards deposit.")
    setPlayerStorageValue(cid,5009,1)
	doPlayerSave(cid)
    else
    doPlayerSendTextMessage(cid,22,"You need level 200 to get prize.")
    end
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
 
return false
end