function onUse(cid, item, frompos, item2, topos)
local HP = 195
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Hiruzen" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Hiruzen Sarutobi!")
else
doPlayerSetVocation(cid, 420)
doCreatureSay(cid, "Hiruzen Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 195)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 370})
doRemoveItem(item.uid)
end
return true
end

