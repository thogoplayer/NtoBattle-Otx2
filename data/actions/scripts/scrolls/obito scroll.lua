function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 210
if getVocationInfo(getPlayerVocation(cid)).name == "Uchiha Obito" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Uchiha Obito!")
else
doPlayerSetVocation(cid, 130)
doCreatureSay(cid, "Uchiha Obito Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 210)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 283})
doRemoveItem(item.uid)
end
return true
end

