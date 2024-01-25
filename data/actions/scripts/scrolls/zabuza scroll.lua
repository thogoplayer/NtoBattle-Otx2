function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 195
if getVocationInfo(getPlayerVocation(cid)).name == "Momochi Zabuza" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Momochi Zabuza!")
else
doPlayerSetVocation(cid, 550)
doCreatureSay(cid, "Momochi Zabuza Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 195)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 967})
doRemoveItem(item.uid)
end
return true
end

