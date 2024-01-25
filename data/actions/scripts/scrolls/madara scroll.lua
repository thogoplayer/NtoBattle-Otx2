function onUse(cid, item, frompos, item2, topos)
local HP = 215
local MP = 215
if getVocationInfo(getPlayerVocation(cid)).name == "Uchiha Madara" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Uchiha Madara!")
else
doPlayerSetVocation(cid, 140)
doCreatureSay(cid, "Uchiha Madara Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 215)
setCreatureMaxMana(cid, 215)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 221})
doRemoveItem(item.uid)
end
return true
end

