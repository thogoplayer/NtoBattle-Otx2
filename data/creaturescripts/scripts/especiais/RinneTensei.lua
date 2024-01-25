function onStatsChange(cid, attacker, type, combat, value)

if exhaustion.check(cid,82223) and type == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(cid) then
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/100*75) -- volta com 75%
exhaustion.set(cid,82223,-1)
unregisterCreatureEvent(cid, "RinneTensei")
end

return true
end