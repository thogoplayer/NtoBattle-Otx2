-- == Blood Castle Event por Killua == --

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
if getPlayerStorageValue(cid, 11511) < 1 then
doPlayerSendTextMessage(cid,22,"Voce recebeu um akatsuki ring, parabens!")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 11485, 1)
setPlayerStorageValue(cid, 11511, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou o item!.")
end
return true
end