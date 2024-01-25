function onDeath(cid, corpse, deathList)
if isPlayer(cid) and getPlayerSkullType(cid) < SKULL_RED then 
doCreatureSetDropLoot(cid, false) 
end
return true 
end