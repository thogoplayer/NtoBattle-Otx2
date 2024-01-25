function onUse(cid, item, frompos, item2, topos)
local HP = 210
local MP = 220
if getVocationInfo(getPlayerVocation(cid)).name == "Yamato" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Yamato!")
else
doPlayerSetVocation(cid, 230)
doCreatureSay(cid, "Yamato Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 210)
setCreatureMaxMana(cid, 220)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1470})
doRemoveItem(item.uid)
end
return true
end

