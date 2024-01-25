function onUse(cid, item, frompos, item2, topos)
local HP = 195
local MP = 200
if getVocationInfo(getPlayerVocation(cid)).name == "Kisame" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Kisame!")
else
doPlayerSetVocation(cid, 160)
doCreatureSay(cid, "Kisame Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 195)
setCreatureMaxMana(cid, 200)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1143})
doRemoveItem(item.uid)
end
return true
end

