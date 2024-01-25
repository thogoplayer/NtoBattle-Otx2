function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Sasori" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Sasori!")
else
doPlayerSetVocation(cid, 320)
doCreatureSay(cid, "Sasori Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 376})
doRemoveItem(item.uid)
end
return true
end

