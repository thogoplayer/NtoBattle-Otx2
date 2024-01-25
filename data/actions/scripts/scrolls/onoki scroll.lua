function onUse(cid, item, frompos, item2, topos)
local HP = 220
local MP = 220
if getVocationInfo(getPlayerVocation(cid)).name == "Onoki" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Onoki!")
else
doPlayerSetVocation(cid, 390)
doCreatureSay(cid, "Onoki Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 220)
setCreatureMaxMana(cid, 220)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 2249})
doRemoveItem(item.uid)
end
return true
end

