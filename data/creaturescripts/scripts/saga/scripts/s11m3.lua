function onStatsChange(cid, attacker, type, combat, value)
if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/5) then
doCreateMonster("kakuzu  ", getThingPos(cid))
doRemoveCreature(cid)
return false
end
return true
end
