function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 2345234) < 1 then
doPlayerSendTextMessage(cid,22,"Você recebeu um premio!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 7898, 1)
doAddContainerItem(bag, 2438, 1)
doAddContainerItem(bag, 11477, 1)
doAddContainerItem(bag, 12148, 1)
doAddContainerItem(bag, 2160, 100)
setPlayerStorageValue(cid, 2345234, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end

return true
end