function onUse(cid, item, frompos, item2, topos)
local HP = 215
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Uzumaki Karin" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Uzumaki Karin!")
else
doPlayerSetVocation(cid, 510)
doCreatureSay(cid, "Uzumaki Karin Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 215)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 932})
doRemoveItem(item.uid)
end
return true
end

