function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Utakata" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Utakata!")
else
doPlayerSetVocation(cid, 650)
doCreatureSay(cid, "Utakata Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2029})
doRemoveItem(item.uid)
end
return true
end

