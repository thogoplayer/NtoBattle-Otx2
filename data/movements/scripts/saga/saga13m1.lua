function onStepIn(cid, item, position, fromPosition)

local pos = {x= 2740, y=3421, z= 7}

if getPlayerSaga(cid, 13, 1) then
doTeleportThing(cid, pos)
doPlayerNextSaga(cid)
return false
end
return true
end