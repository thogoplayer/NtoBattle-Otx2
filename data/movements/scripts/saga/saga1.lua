function onStepIn(cid, item, position, fromPosition)
if getPlayerSaga(cid, 1, 3) then
doTeleportThing(cid, {x = 1972, y = 1968, z = 7})
doPlayerNextSaga(cid)
registerCreatureEvent(cid, "SagaOnemFourK")
end
return true
end