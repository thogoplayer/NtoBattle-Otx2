function onCombat(cid, target)
if getGlobalStorageValue(11111) < 0 then return true end
if getPlayerAccess(cid) > 2 and isCreature(target) then return true end
return false
end

function onStatsChange(target, cid, changetype, combat, value)
if(getGlobalStorageValue(11111) > 0 and changetype == STATSCHANGE_HEALTHLOSS) then
doCreatureAddHealth(target, getCreatureMaxHealth(target))
return false
end
return true
end