local storage = 6425223

function onLogin(cid)
registerCreatureEvent(cid, "Tobirama Dimensao")
if getPlayerStorageValue(cid, storage) >= 1 then
setPlayerStorageValue(cid, storage, 0)
end
return true
end


function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if getPlayerStorageValue(cid,storage) > 0 and isCreature(attacker) then
return false
end
end
return true
end