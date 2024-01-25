function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 220
if getVocationInfo(getPlayerVocation(cid)).name == "Terumi Mei" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Terumi Mei!")
else
doPlayerSetVocation(cid, 530)
doCreatureSay(cid, "Terumi Mei Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 220)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1625})
doRemoveItem(item.uid)
end
return true
end

