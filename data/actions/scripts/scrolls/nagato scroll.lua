function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 205
if getVocationInfo(getPlayerVocation(cid)).name == "Nagato" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Nagato!")
else
doPlayerSetVocation(cid, 460)
doCreatureSay(cid, "Nagato Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 205)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2213})
doRemoveItem(item.uid)
end
return true
end

