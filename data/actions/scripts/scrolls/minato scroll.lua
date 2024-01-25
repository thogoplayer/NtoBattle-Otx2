function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 215
if getVocationInfo(getPlayerVocation(cid)).name == "Namikaze Minato" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Namikaze Minato!")
else
doPlayerSetVocation(cid, 180)
doCreatureSay(cid, "Namikaze Minato Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 215)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 239})
doRemoveItem(item.uid)
end
return true
end

