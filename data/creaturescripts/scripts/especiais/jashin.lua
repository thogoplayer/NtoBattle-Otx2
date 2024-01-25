function onStatsChange(cid, attacker, type, combat, value)
if exhaustion.check(cid, 45223) and isCreature(getCreatureTarget(cid)) then
doCreatureAddHealth(getCreatureTarget(cid), -value, 0, 180)
return false
end
return true
end