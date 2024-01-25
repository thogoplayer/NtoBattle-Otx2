function onStepIn(cid, item, position, fromPosition)

local pos = {x= 2753, y=3506, z= 3}

if getPlayerSaga(cid, 13, 3) then
registerCreatureEvent(cid, "SagaItachiGen")
doTeleportThing(cid, pos)
return false
end
return true
end