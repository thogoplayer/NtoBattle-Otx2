function onStepIn(cid, item, position, fromPosition)

if getPlayerSaga(cid, 2, 3) then
doSetCreatureOutfit(cid, {lookType = 266}, -1)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 2300, y=3698, z= 7})
return true
end
return true
end