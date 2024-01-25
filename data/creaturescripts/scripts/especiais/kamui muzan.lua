local storage = 4532324
local valordostorage = 1

function onLogin(cid)
registerCreatureEvent(cid, "KamuiMuzanS")
registerCreatureEvent(cid, "KamuiMuzanT")
registerCreatureEvent(cid, "KamuiMuzanC")
if getPlayerStorageValue(cid, storage) >= 1 then
setPlayerStorageValue(cid, storage, 0)
end
return true
end

function onCombat(cid, target)
if (isPlayer(cid)) and (isCreature(target)) and (getPlayerStorageValue(cid, storage) >= 1)  then
doPlayerSendCancel(cid, "Você não pode atacar enquanto estiver sob efeito do Kamui Muzan")
elseif (isPlayer(target)) and (isCreature(cid)) and (getPlayerStorageValue(target, storage) >= 1)  then
return false
else
return true
end
end

function onStatsChange(cid, attacker, type, combat, value)
if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
if getPlayerStorageValue(cid, storage) >= 1 and isCreature(attacker) then
return false
end
end
return true
end

function onTarget(cid, target)
if (isPlayer(cid)) and (isCreature(target)) and (getPlayerStorageValue(cid, storage) >= 1)  then
doPlayerSendCancel(cid, "Você não pode atacar enquanto estiver sob efeito do Kamui Muzan")
elseif (isPlayer(target)) and (isCreature(cid)) and (getPlayerStorageValue(target, storage) >= 1)  then
return false
else
return true
end
end

