function onUse(cid, item, frompos, item2, topos)
local HP = 225
local MP = 225
if getVocationInfo(getPlayerVocation(cid)).name == "Zetsu" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Zetsu!")
else
doPlayerSetVocation(cid, 670)
doCreatureSay(cid, "Zetsu Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 225)
setCreatureMaxMana(cid, 225)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2004})
doRemoveItem(item.uid)
end
return true
end

