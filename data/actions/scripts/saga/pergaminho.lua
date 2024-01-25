function onUse(cid, item, frompos, item2, topos)

if not getPlayerSaga(cid, 1, 2) then
return doPlayerSendCancel(cid, "[SAGA SYSTEM] You don't belong on this mission.")
end

if getPlayerStorageValue(cid, 19896) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de roubar o Pergaminho Secreto!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2155, 1)
setPlayerStorageValue(cid, 19896, 1)
doPlayerNextSaga(cid)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o Pergaminho Secreto!.")
end

return true
end