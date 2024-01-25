function onStepIn(cid, item, position, fromPosition)

local pos = {{x = 2709, y = 3435, z = 7},{x = 2831, y = 3508, z = 7}}

if checkMonstersInArea(pos,{"Deidara     "}) and getPlayerSaga(13 , 2) then
doTeleportThing(cid, fromPosition)
if isPlayer(cid) then
doPlayerSendCancel(cid, "Derrote Deidara")
end
return false
end
return true
end