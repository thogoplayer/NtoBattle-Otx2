function onUse(cid, item, frompos, item2, topos)
local HP = 215
local MP = 235
if getVocationInfo(getPlayerVocation(cid)).name == "Kurenai" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Kurenai!")
else
doPlayerSetVocation(cid, 400)
doCreatureSay(cid, "Kurenai Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 215)
setCreatureMaxMana(cid, 235)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 215})
doRemoveItem(item.uid)
end
return true
end

