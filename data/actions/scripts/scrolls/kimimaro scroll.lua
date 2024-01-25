function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 170
if getVocationInfo(getPlayerVocation(cid)).name == "Kaguya Kimimaro" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Kaguya Kimimaro!")
else
doPlayerSetVocation(cid, 520)
doCreatureSay(cid, "Kaguya Kimimaro Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 170)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 194})
doRemoveItem(item.uid)
end
return true
end

