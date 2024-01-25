local storage = 574433
local valordostorage = 23
local monstros = {12345}
function onCombat(cid, target)
if ((isPlayer(cid)) and (isMonster(target)) and (not(getPlayerStorageValue(cid, storage) == valordostorage)) and (isInArray(monstros, getCreatureHealth(target)))) or ((isMonster(cid)) and (isPlayer(target)) and (not(getPlayerStorageValue(target, storage) == valordostorage))) then
return false
end
return true
end

function onTarget(cid, target)
if ((isPlayer(cid)) and (isMonster(target)) and (not(getPlayerStorageValue(cid, storage) == valordostorage)) and (isInArray(monstros, getCreatureHealth(target)))) or ((isMonster(cid)) and (isPlayer(target)) and (not(getPlayerStorageValue(target, storage) == valordostorage))) then
return false
end
return true
end
