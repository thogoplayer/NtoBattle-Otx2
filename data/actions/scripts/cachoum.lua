function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 19883) < 1 then
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 7457, 1)
setPlayerStorageValue(cid, 19883, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return true
end