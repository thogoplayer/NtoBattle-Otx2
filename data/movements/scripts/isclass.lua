function onStepIn(cid, item, position, fromPosition)

if item.actionid == 46521 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) >= 1 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas genins ou superior podem ter acesso a esta area!")
end

elseif item.actionid == 46522 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) >= 2 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas chunins ou superior podem ter acesso a esta area!")
end

elseif item.actionid == 46523 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) >= 3 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas jounins ou superior podem ter acesso a esta area!")
end

elseif item.actionid == 46524 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) >= 4 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas anbus ou superior podem ter acesso a esta area!")
end

elseif item.actionid == 46525 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) >= 5 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas sennins ou superior podem ter acesso a esta area!")
end

elseif item.actionid == 46531 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) == 1 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas genins podem ter acesso a esta area!")
end

elseif item.actionid == 46532 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) == 2 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas chunins podem ter acesso a esta area!")
end

elseif item.actionid == 46533 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) == 3 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas jounins podem ter acesso a esta area!")
end

elseif item.actionid == 46534 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) == 4 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas anbus podem ter acesso a esta area!")
end

elseif item.actionid == 46535 and isPlayer(cid) then
if getPlayerStorageValue(cid, 89745) == 5 then
else
doTeleportThing(cid, fromPosition)
doPlayerSendTextMessage(cid, 27,"Apenas sennins podem ter acesso a esta area!")
end
return true
end
end