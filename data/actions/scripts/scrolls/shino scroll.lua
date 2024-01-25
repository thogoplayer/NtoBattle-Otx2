function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 195
if getVocationInfo(getPlayerVocation(cid)).name == "Aburame Shino" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Aburame Shino!")
else
doPlayerSetVocation(cid, 540)
doCreatureSay(cid, "Aburame Shino Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 195)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 419})
doRemoveItem(item.uid)
end
return true
end

