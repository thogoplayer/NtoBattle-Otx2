function onUse(cid, item, frompos, item2, topos)


if getPlayerStorageValue(cid,5010) == -1 then
    if getPlayerLevel(cid) >= 500 then
	doAddContainerItemRandom(cid, {11106}, 0)
	doSendMagicEffect(getCreaturePosition(cid), 745,cid)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Uzukami Token Congratulations!\nyou received "..getPlayerStorageValue(cid, 942134).." in your rewards deposit.")
    setPlayerStorageValue(cid,5010,1)
	doPlayerSave(cid)
    else
    doPlayerSendTextMessage(cid,22,"You need level 500 to get prize.")
    end
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
 
return false
end