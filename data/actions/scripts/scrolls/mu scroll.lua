function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 230
if getVocationInfo(getPlayerVocation(cid)).name == "Mu" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Mu!")
else
doPlayerSetVocation(cid, 410)
doCreatureSay(cid, "Mu Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 230)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2194})
doRemoveItem(item.uid)
end
return true
end

