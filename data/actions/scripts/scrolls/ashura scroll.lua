function onUse(cid, item, frompos, item2, topos)
local HP = 225
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Otsutsuki Ashura" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Otsutsuki Ashura!")
else
doPlayerSetVocation(cid, 480)
doCreatureSay(cid, "Otsutsuki Ashura Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 225)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1700})
doRemoveItem(item.uid)
end
return true
end

