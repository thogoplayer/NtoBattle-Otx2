function onStepIn(cid, item, pos, position, fromPosition)
return true
end

function onStepOut(cid, item, pos, position, fromPosition)
local idbau = 14139
local mypos = getCreaturePosition(cid)

local function AntiAminesia(cid, pos, container)
local depot = getTileItemById({x= pos.x, y=pos.y-2, z= pos.z}, container).uid
if depot <= 1 then return end
if not isContainer(depot) then return true end
if (getContainerSize(depot)) > 0 then 
doPlayerSendTextMessage(cid, 22, "Retire o(s) item(s) do baú.") 
doTeleportThing(cid, fromPosition)
end
end

AntiAminesia(cid, mypos, idbau)
return true
end