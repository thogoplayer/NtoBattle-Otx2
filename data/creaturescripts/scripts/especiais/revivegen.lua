function onStatsChange(cid, attacker, type, combat, value)
if isCreature(attacker) then
doCreatureAddHealth(attacker, -value, 0, 180)
-- doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
return false
end
return true
end