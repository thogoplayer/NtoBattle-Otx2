function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 215
if getVocationInfo(getPlayerVocation(cid)).name == "Sarutobi Konohamaru" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Sarutobi Konohamaru!")
else
doPlayerSetVocation(cid, 630)
doCreatureSay(cid, "Sarutobi Konohamaru Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 215)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2182})
doRemoveItem(item.uid)
end
return true
end

