function onDeath(cid, corpse, killer)
setGlobalStorageValue(12530, -1)
local from,to = {x = 2716, y = 3545, z = 6},{x = 2751, y = 3573, z = 6}
for x = from.x, to.x do
for y = from.y, to.y do
local mob = getTopCreature({x=x, y=y, z=6}).uid
if isPlayer(mob) then
doTeleportThing(mob, {x=getCreaturePosition(mob).x, y=getCreaturePosition(mob).y, z=getCreaturePosition(mob).z+1})
end
end
end
return TRUE
end