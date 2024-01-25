function onStatsChange(cid, attacker, type, combat, value)
if exhaustion.check(cid,14500) and type == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(cid) then
-- doTeleportThing(cid, getPos(cid, 14501))
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/100*75)
exhaustion.set(cid,14500,-1)
unregisterCreatureEvent(cid, "izanagi")
return true
end
return true
end