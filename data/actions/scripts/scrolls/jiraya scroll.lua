function onUse(cid, item, frompos, item2, topos)
local HP = 225
local MP = 200
if getVocationInfo(getPlayerVocation(cid)).name == "Jiraya" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Jiraya!")
else
doPlayerSetVocation(cid, 190)
doCreatureSay(cid, "Jiraya Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 225)
setCreatureMaxMana(cid, 200)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 145})
doRemoveItem(item.uid)
end
return true
end

