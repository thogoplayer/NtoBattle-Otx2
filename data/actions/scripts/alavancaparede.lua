function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {{x = 2420, y = 1922, z = 9, stackpos=1}}
local tempo = 2*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos[1])
if item.uid == 8107 and item.itemid == 1945 and getpiece1.itemid == 1515 then
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
for i=1, #piece1pos do
getpiece1 = getThingfromPos(piece1pos[i])
doRemoveItem(getpiece1.uid,1)
addEvent(doCreateItem, tempo, 1515, piece1pos[i])
end
addEvent(doTransformItem, tempo, item.uid,1945)
elseif item.uid == 8107 and item.itemid == 9828 then
doTransformItem(item.uid,item.itemid-1)
for i=1, #piece1pos do
addEvent(doCreateItem, 2*60*1000, item.itemid, piece1pos[i])
end
else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end