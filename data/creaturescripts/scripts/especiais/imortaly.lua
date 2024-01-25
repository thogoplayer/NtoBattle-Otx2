local storage = 424513

function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if getPlayerStorageValue(cid,storage) > 0 and isCreature(attacker) then
doSendMagicEffect(getCreaturePosition(cid), 2)
doSendAnimatedText(getCreaturePosition(cid), "IMORTAL", 180)
return false
end
end
return true
end