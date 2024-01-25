function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Shimura Danzou" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Shimura Danzou!")
else
doPlayerSetVocation(cid, 370)
doCreatureSay(cid, "Shimura Danzou Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 15})
doRemoveItem(item.uid)
end
return true
end

