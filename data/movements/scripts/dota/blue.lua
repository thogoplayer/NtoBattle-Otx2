function onStepIn(cid, item, frompos, item2, topos)

local outfit = {lookType = 128, lookHead = 88, lookBody = 114, lookLegs = 114, lookFeet = 88, lookAddons = 0}

if item.actionid == 5031 and isPlayer(cid) then
doCreatureChangeOutfit(cid, outfit)
doPlayerSetTown(cid, 7)
end
return true
end