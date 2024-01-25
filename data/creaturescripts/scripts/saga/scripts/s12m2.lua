function onKill(cid, target)
if getCreatureName(target) == "Ninja" and getPlayerSaga(cid, 12, 2) then 
setPlayerStorageValue(cid,40234, getPlayerStorageValue(cid, 40234)+1)
if getPlayerStorageValue(cid, 40234) >= 1000 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você derrotou 1000 ninjas")
doPlayerNextSaga(cid)
unregisterCreatureEvent(cid, "SagaTwelveNinjas") 
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,""..getPlayerStorageValue(cid, 40234).." Ninjas derrotados")
end
end
return true
end