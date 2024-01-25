function onUse(cid, item, frompos, item2, topos)


------fuuton-------
local position129 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
if item.itemid == 2264 then
if getPlayerStorageValue(cid, 3001) < 10 then
doPlayerSendTextMessage(cid,22,"Voce upou sua Fuuton skill")
setPlayerStorageValue(cid, 3001, getPlayerStorageValue(cid, 3001)+1)
doSendAnimatedText(getCreaturePosition(cid), "Skill UP", 143)
doSendMagicEffect(position129, 94)
doRemoveItem(item.uid, 1)
else
if getPlayerStorageValue(cid, 3001) == 10 then
doPlayerSendTextMessage(cid,20,"Sua fuuton skill ja esta no maximo")
end
end
end


------katon-------
if item.itemid == 2263 then
if getPlayerStorageValue(cid, 3002) < 10 then
doPlayerSendTextMessage(cid,22,"Voce upou sua Katon skill")
setPlayerStorageValue(cid, 3002, getPlayerStorageValue(cid, 3002)+1)
doSendAnimatedText(getCreaturePosition(cid), "Skill UP", 192)
doSendMagicEffect(getPlayerPosition(cid), 15)
doRemoveItem(item.uid, 1)
else
if getPlayerStorageValue(cid, 3002) == 10 then
doPlayerSendTextMessage(cid,20,"Sua katon skill ja esta no maximo")
end
end
end

------raiton-------
if item.itemid == 2262 then
if getPlayerStorageValue(cid, 3005) < 10 then
doPlayerSendTextMessage(cid,22,"Voce upou sua Raiton skill")
setPlayerStorageValue(cid, 3005, getPlayerStorageValue(cid, 3005)+1)
doSendAnimatedText(getCreaturePosition(cid), "Skill UP", 210)
doSendMagicEffect(getPlayerPosition(cid), 4)
doRemoveItem(item.uid, 1)
else
if getPlayerStorageValue(cid, 3005) == 10 then
doPlayerSendTextMessage(cid,20,"Sua Raiton skill ja esta no maximo")
end
end
end

------suiton-------
if item.itemid == 2261 then
if getPlayerStorageValue(cid, 3003) < 10 then
doPlayerSendTextMessage(cid,22,"Voce upou sua Suiton skill")
setPlayerStorageValue(cid, 3003, getPlayerStorageValue(cid, 3003)+1)
doSendAnimatedText(getCreaturePosition(cid), "Skill UP", 101)
doSendMagicEffect(position129, 57)
doRemoveItem(item.uid, 1)
else
if getPlayerStorageValue(cid, 3003) == 10 then
doPlayerSendTextMessage(cid,20,"Sua Suiton skill ja esta no maximo")
end
end
end

------doton-------
if item.itemid == 2265 then
if getPlayerStorageValue(cid, 3004) < 10 then
doPlayerSendTextMessage(cid,22,"Voce upou sua Doton skill")
setPlayerStorageValue(cid, 3004, getPlayerStorageValue(cid, 3004)+1)
doSendAnimatedText(getCreaturePosition(cid), "Skill UP", 121)
doSendMagicEffect(getPlayerPosition(cid), 180)
doRemoveItem(item.uid, 1)
else
if getPlayerStorageValue(cid, 3004) == 10 then
doPlayerSendTextMessage(cid,20,"Sua Doton skill ja esta no maximo")
end
end
end

return true
end