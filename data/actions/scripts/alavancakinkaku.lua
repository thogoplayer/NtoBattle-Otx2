function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {{x = 2334, y = 1745, z = 9, stackpos=1}}
local tempo = 2*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos[1])
if item.uid == 8108 and item.itemid == 1945 and getpiece1.itemid == 1514 then
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"Olha la, os pilares estão se movendo.")
for i=1, #piece1pos do
getpiece1 = getThingfromPos(piece1pos[i])
doRemoveItem(getpiece1.uid,1)
addEvent(doCreateItem, tempo, 1514, piece1pos[i])
end
addEvent(doTransformItem, tempo, item.uid,1945)
elseif item.uid == 8108 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
for i=1, #piece1pos do
addEvent(doCreateItem, 1*60*1000, item.itemid, piece1pos[i])
end
else
doPlayerSendTextMessage(cid,22,"Não é possivel realizar esta ação.")
end
return 1
end