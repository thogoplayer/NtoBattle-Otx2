function onUse(cid, item, frompos, item2, topos)
local HP = 215
local MP = 205
if getVocationInfo(getPlayerVocation(cid)).name == "Ino" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Ino!")
else
doPlayerSetVocation(cid, 340)
doCreatureSay(cid, "Ino Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 215)
setCreatureMaxMana(cid, 205)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1797})
doRemoveItem(item.uid)
end
return true
end

