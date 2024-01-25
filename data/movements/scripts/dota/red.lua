function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 128, lookHead = 94, lookBody = 114, lookLegs = 114, lookFeet = 94, lookAddons = 0}

if item.actionid == 5032 and isPlayer(cid) then
doCreatureChangeOutfit(cid, outfit)
doPlayerSetTown(cid, 8)
end
return true
end