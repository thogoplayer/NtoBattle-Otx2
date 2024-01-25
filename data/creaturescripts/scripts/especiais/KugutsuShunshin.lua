function onStatsChange(cid, attacker, type, combat, value)
if exhaustion.check(cid,14100) and type == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(cid) and #getCreatureSummons(cid) > 0 then
local puppet = getCreatureSummons(cid)[1]
doTeleportThing(cid, getCreaturePosition(puppet))
doRemoveCreature(puppet)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
exhaustion.set(cid,14100,-1)
unregisterCreatureEvent(cid, "KugutsuShunshin")
return true
end
return true
end