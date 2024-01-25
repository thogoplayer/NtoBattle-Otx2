function onUse(cid, item, frompos, item2, topos)
local HP = 195
local MP = 235
if getVocationInfo(getPlayerVocation(cid)).name == "Orochimaru" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Orochimaru!")
else
doPlayerSetVocation(cid, 210)
doCreatureSay(cid, "Orochimaru Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 195)
setCreatureMaxMana(cid, 235)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 310})
doRemoveItem(item.uid)
end
return true
end

