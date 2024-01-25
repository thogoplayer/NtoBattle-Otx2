function onUse(cid, item, frompos, item2, topos)
local HP = 210
local MP = 200
if getVocationInfo(getPlayerVocation(cid)).name == "Might Guy" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already um Might Guy!")
else
doPlayerSetVocation(cid, 380)
doCreatureSay(cid, "Might Guy Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 210)
setCreatureMaxMana(cid, 200)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 56)
doCreatureChangeOutfit(cid, {lookType = 15})
doRemoveItem(item.uid)
end
return true
end

