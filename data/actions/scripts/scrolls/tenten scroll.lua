function onUse(cid, item, frompos, item2, topos)
local HP = 225
local MP = 230
if getVocationInfo(getPlayerVocation(cid)).name == "Tenten" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Tenten!")
else
doPlayerSetVocation(cid, 90)
doCreatureSay(cid, "Tenten Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 225)
setCreatureMaxMana(cid, 230)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1576})
doRemoveItem(item.uid)
end
return true
end

