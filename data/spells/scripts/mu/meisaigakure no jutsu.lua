function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 13113) == true then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 13113) .. " segundos para usar novamente.")
return false
end

exhaustion.set(cid, 13113, 300)

exhaustion.set(cid, 12121, 10)
if ((getPlayerStorageValue(cid,93123) == 1) or (getPlayerStorageValue(cid,93123) == 2) or (getPlayerStorageValue(cid,93123) == 6)) then
doSetCreatureOutfit(cid, {lookType = 507}, -1)
elseif (getPlayerStorageValue(cid,93123) == 3) then
doSetCreatureOutfit(cid, {lookType = 508}, -1)
elseif (getPlayerStorageValue(cid,93123) == 4) then
doSetCreatureOutfit(cid, {lookType = 509}, -1)
elseif (getPlayerStorageValue(cid,93123) == 5) then
doSetCreatureOutfit(cid, {lookType = 510}, -1)
elseif (getPlayerStorageValue(cid,93123) == 7) then
doSetCreatureOutfit(cid, {lookType = 511}, -1)
else
doSetCreatureOutfit(cid, {lookType = 507}, -1)
end

setPlayerStorageValue(cid, 427224,1) 

setPlayerStorageValue(cid, 427223,1) 

parameters = {cid=cid}

setPlayerGroupId(cid, 2)

doCreatureExecuteTalkAction(cid, "/ghost", true)

addEvent(talk, 10000, parameters)

return true

end

 

function talk(parameters)
if isCreature(parameters.cid) then

doCreatureExecuteTalkAction(parameters.cid, "/ghost", true)

setPlayerGroupId(parameters.cid, 1)

setPlayerStorageValue(parameters.cid, 427224, -1) 

setPlayerStorageValue(parameters.cid, 427223, -1) 

doRemoveCondition(parameters.cid, CONDITION_OUTFIT)

end

end