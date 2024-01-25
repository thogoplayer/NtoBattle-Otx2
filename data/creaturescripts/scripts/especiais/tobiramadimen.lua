local storage = 6425223

function onLogin(cid)
registerCreatureEvent(cid, "Tobirama Dimensao")
registerCreatureEvent(cid, "Tobirama Dimen2")
if isCreature(cid) and getPlayerStorageValue(cid, storage) >= 1 then
setPlayerStorageValue(cid, storage, 0)
end
return true
end


function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS)) and getPlayerStorageValue(cid,storage) > 0 then
return false
end
return true
end

function onTarget(cid, target)
if (isPlayer(cid)) and (isCreature(target)) and (getPlayerStorageValue(target, storage) > 0)  then
doPlayerSendCancel(cid, "Você não pode atacar enquanto estiver sob efeito do Genjutsu")
return false
end
return true
end