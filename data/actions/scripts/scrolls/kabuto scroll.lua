function onUse(cid, item, frompos, item2, topos)
local HP = 205
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Yakushi Kabuto" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Yakushi Kabuto!")
else
doPlayerSetVocation(cid, 470)
doCreatureSay(cid, "Yakushi Kabuto Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 205)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 154})
doRemoveItem(item.uid)
end
return true
end

