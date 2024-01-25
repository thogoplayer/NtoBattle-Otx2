function onUse(cid, item, frompos, item2, topos)
local HP = 225
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Raikage A" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Raikage A!")
else
doPlayerSetVocation(cid, 200)
doCreatureSay(cid, "Raikage A Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 225)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 326})
doRemoveItem(item.uid)
end
return true
end

