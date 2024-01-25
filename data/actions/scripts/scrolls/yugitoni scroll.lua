function onUse(cid, item, frompos, item2, topos)
local HP = 200
local MP = 190
if getVocationInfo(getPlayerVocation(cid)).name == "Yugito Nii" then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "you are already Yugito Nii!")
else
doPlayerSetVocation(cid, 670)
doCreatureSay(cid, "Yugito Nii Owns!!", 19) 
setPlayerStorageValue(cid, 543245, getPlayerLevel(cid))
doPlayerAddLevel(cid, -1000)
setCreatureMaxHealth(cid, 200)
setCreatureMaxMana(cid, 190)
doPlayerAddLevel(cid, getPlayerStorageValue(cid, 543245)-1)
doSendMagicEffect(getCreaturePosition(cid), 321)
doCreatureChangeOutfit(cid, {lookType = 1980})
doRemoveItem(item.uid)
end
return true
end

