function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Roshi" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Roshi!")
else
doPlayerSetVocation(cid, 640)
doCreatureSay(cid, "Roshi Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2013})
doRemoveItem(item.uid)
end
return true
end

