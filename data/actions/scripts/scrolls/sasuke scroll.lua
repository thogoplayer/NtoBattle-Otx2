function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 205
if getVocationInfo(getPlayerVocation(cid)).name == "Sasuke" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Sasuke!")
else
doPlayerSetVocation(cid, 10)
doCreatureSay(cid, "Sasuke Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 205)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 389})
doRemoveItem(item.uid)
end
return true
end

