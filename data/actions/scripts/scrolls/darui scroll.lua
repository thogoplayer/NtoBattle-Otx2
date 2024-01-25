function onUse(cid, item, frompos, item2, topos)
local HP = 210
local MP = 235
if getVocationInfo(getPlayerVocation(cid)).name == "Darui" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Darui!")
else
doPlayerSetVocation(cid, 570)
doCreatureSay(cid, "Darui Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 210)
setCreatureMaxMana(cid, 235)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2082})
doRemoveItem(item.uid)
end
return true
end

