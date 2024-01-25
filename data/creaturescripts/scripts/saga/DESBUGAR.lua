function onDeath(cid, position)
if isCreature(cid) and getCreatureIn(cid, AREA_SAGA) then
SAGASYSTEM.RETURN[getPlayerStorageValue(cid, SAGASTO)](cid)
end
return true
end

function onLogout(cid)
if isCreature(cid) and getCreatureIn(cid, AREA_SAGA) then
SAGASYSTEM.RETURN[getPlayerStorageValue(cid, SAGASTO)](cid)
end
return true
end
