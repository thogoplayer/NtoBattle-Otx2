function onUse(cid, item, frompos, item2, topos)
local HP = 190
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Neji" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Neji!")
else
doPlayerSetVocation(cid, 50)
doCreatureSay(cid, "Neji Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 190)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2248})
doRemoveItem(item.uid)
end
return true
end

