function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Sarutobi Asuma" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Sarutobi Asuma!")
else
doPlayerSetVocation(cid, 580)
doCreatureSay(cid, "Sarutobi Asuma Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2062})
doRemoveItem(item.uid)
end
return true
end

