function onStatsChange(cid, attacker, type, combat, value)
if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/2) then
local pos = getThingPos(cid)
doRemoveCreature(cid)
local shi = doCreateMonster("gaarademonchunin", pos)
doCreatureAddHealth(shi, -(getCreatureMaxHealth(shi)/2))
return false
end
return true
end