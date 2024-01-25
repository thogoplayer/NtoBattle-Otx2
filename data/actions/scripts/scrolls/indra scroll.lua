function onUse(cid, item, frompos, item2, topos)
local HP = 215
local MP = 215
if getVocationInfo(getPlayerVocation(cid)).name == "Otsutsuki Indra" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Otsutsuki Indra!")
else
doPlayerSetVocation(cid, 500)
doCreatureSay(cid, "Otsutsuki Indra Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 215)
setCreatureMaxMana(cid, 215)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1725})
doRemoveItem(item.uid)
end
return true
end

