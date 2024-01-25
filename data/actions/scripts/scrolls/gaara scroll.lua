function onUse(cid, item, frompos, item2, topos)
local HP = 195
local MP = 195
if getVocationInfo(getPlayerVocation(cid)).name == "Gaara" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Gaara!")
else
doPlayerSetVocation(cid, 40)
doCreatureSay(cid, "Gaara Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 195)
setCreatureMaxMana(cid, 195)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1452})
doRemoveItem(item.uid)
end
return true
end

