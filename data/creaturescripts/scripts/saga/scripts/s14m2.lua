function onStatsChange(cid, attacker, type, combat, value)
if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/2) then
local shi = doCreateMonster("Killer Bee ", getThingPos(cid))
doCreatureAddHealth(shi, -(getCreatureMaxHealth(shi)/2))
doRemoveCreature(cid)
return false
end
return true
end
