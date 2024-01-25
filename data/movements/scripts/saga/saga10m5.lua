function onStepIn(cid, item, position, fromPosition)

local pos = {{x= 1087, y=2644, z= 4},{x= 1116, y=2649, z= 4}}

if isPlayer(cid) and getPlayerSaga(cid, 10, 5) and checkMonstersInArea(pos,{"Orochimaru     "}) then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Derrote Orochimaru")
return false
end

return true
end