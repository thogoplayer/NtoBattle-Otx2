local storage = 423414
local valordostorage = 1

function onLogin(cid)
registerCreatureEvent(cid, "NonCorvo")
registerCreatureEvent(cid, "NonCorvo2")
registerCreatureEvent(cid, "GenItachiT")
registerCreatureEvent(cid, "GenItachiC")
if getPlayerStorageValue(cid, storage) >= 1 then
setPlayerStorageValue(cid, storage, 0)
end
return true
end

function onCombat(cid, target)
if ((isPlayer(cid)) and (isCreature(target)) and (exhaustion.check(cid, 65322) == true)) or ((isCreature(cid)) and (isPlayer(target)) and (exhaustion.check(target, 65322) == true)) then
if (exhaustion.check(cid, 65322) == true) then
if isPlayer(cid) then
doPlayerSendCancel(cid, "Você não pode atacar enquanto estiver sob efeito do Genjutsu")
end
else
if isPlayer(cid) then
doPlayerSendCancel(cid, "Você não pode atacar seu inimigo enquanto ele estiver sob efeito de um Genjutsu")
end
end
return false
end
return true
end

function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if exhaustion.check(cid, 65322) == true and isCreature(attacker) then
return false
end
end
return true
end

function onTarget(cid, target)
if (isPlayer(cid)) and (isCreature(target)) and (exhaustion.check(cid, 65322) == true) or ((isPlayer(cid)) and (isPlayer(target)) and (exhaustion.check(target, 65322) == true)) or ((isMonster(cid)) and (isPlayer(target)) and (exhaustion.check(target, 65322) == true))then
if isPlayer(cid) and (exhaustion.check(cid, 65322) == true) then
if isPlayer(cid) then
doPlayerSendCancel(cid, "Você não pode atacar enquanto estiver sob efeito do Genjutsu")
end
else
if isPlayer(cid) then
doPlayerSendCancel(cid, "Você não pode atacar seu inimigo enquanto ele estiver sob efeito de um Genjutsu")
end
end
return false
end
return true
end


