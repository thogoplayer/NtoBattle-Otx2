function onUse(cid, item, frompos, item2, topos)
local HP = 180
local MP = 200
if getVocationInfo(getPlayerVocation(cid)).name == "Haku" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Haku!")
else
doPlayerSetVocation(cid, 290)
doCreatureSay(cid, "Haku Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 180)
setCreatureMaxMana(cid, 200)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 73})
doRemoveItem(item.uid)
end
return true
end

