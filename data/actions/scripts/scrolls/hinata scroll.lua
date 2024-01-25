function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 200
if getVocationInfo(getPlayerVocation(cid)).name == "Hinata" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Hinata!")
else
doPlayerSetVocation(cid, 80)
doCreatureSay(cid, "Hinata Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 200)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 107})
doRemoveItem(item.uid)
end
return true
end

