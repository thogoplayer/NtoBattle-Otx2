function onUse(cid, item, frompos, item2, topos)
local HP = 185
local MP = 195
if getVocationInfo(getPlayerVocation(cid)).name == "Deidara" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Deidara!")
else
doPlayerSetVocation(cid, 240)
doCreatureSay(cid, "Deidara Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 185)
setCreatureMaxMana(cid, 195)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1711})
doRemoveItem(item.uid)
end
return true
end

