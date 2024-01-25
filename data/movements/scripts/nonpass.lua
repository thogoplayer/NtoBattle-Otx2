function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

local players = getAllPlayersInArea(toPosition, toPosition)
if #players >= 2 then
doTeleportThing(cid, fromPosition)
return false
end


return true
end