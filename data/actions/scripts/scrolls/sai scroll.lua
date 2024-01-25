function onUse(cid, item, frompos, item2, topos)
local HP = 195
local MP = 205
if getVocationInfo(getPlayerVocation(cid)).name == "Sai" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Sai!")
else
doPlayerSetVocation(cid, 270)
doCreatureSay(cid, "Sai Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 195)
setCreatureMaxMana(cid, 205)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 337})
doRemoveItem(item.uid)
end
return true
end

