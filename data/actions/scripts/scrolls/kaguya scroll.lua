function onUse(cid, item, frompos, item2, topos)
local HP = 210
local MP = 230
if getVocationInfo(getPlayerVocation(cid)).name == "Otsutsuki Kaguya" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Otsutsuki Kaguya!")
else
doPlayerSetVocation(cid, 310)
doCreatureSay(cid, "Otsutsuki Kaguya Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 210)
setCreatureMaxMana(cid, 230)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 905)
doCreatureChangeOutfit(cid, {lookType = 1646})
doRemoveItem(item.uid)
end
return true
end

