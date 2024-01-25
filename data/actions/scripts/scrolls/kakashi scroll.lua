function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 175
if getVocationInfo(getPlayerVocation(cid)).name == "Kakashi" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Kakashi!")
else
doPlayerSetVocation(cid, 120)
doCreatureSay(cid, "Kakashi Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 175)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 162})
doRemoveItem(item.uid)
end
return true
end

