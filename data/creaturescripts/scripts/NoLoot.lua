function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
if isPlayer(cid) == true then
if (getCreatureSkullType(cid) < 3) then
doCreatureSetDropLoot(cid, false)
return true  
end
end
return true
end
