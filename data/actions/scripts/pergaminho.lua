function onUse(cid, item, frompos, item2, topos)

if (not(getPlayerStorageValue(cid, 40000) == 2)) then
doPlayerPopupFYI(cid, "Voce nao pertence a esta Saga")
return false
end

if getPlayerStorageValue(cid, 19816) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Pergaminho Secreto!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 2155, 1)
setPlayerStorageValue(cid, 19816, 1)
setPlayerStorageValue(cid,40000, 3)
doPlayerPopupFYI(cid, "["..getPlayerStorageValue(cid, 40000).."/62] Fuja para a floresta ao oeste de konoha")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o Pergaminho Secreto!.")
end

return true
end