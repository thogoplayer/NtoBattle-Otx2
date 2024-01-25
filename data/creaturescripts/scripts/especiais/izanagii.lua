function onStatsChange(cid, attacker, type, combat, value)
if exhaustion.check(cid,14500) and type == STATSCHANGE_HEALTHLOSS and math.abs(value) >= getCreatureHealth(cid) then
if getPlayerStorageValue(cid, 14504) == 2 then
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/100*75)
else
doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/100*50)
exhaustion.set(cid,14500,-1)
unregisterCreatureEvent(cid, "izanagii")
end
doSendMagicEffect(getCreaturePosition(cid), 108)
setPlayerStorageValue(cid, 14504, getPlayerStorageValue(cid, 14504)-1)
-- doTeleportThing(cid, getPos(cid, 14501))
return true
end
return true
end