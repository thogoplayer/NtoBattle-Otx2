function onStepIn(cid, item, position, fromPosition)

if getPlayerSaga(cid, 10, 3) then
doSetCreatureOutfit(cid, {lookType = 378}, -1)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x = 1091, y = 2709, z = 13} , false)
end

return true
end