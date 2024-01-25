local function BlockAttack(cid)
if getPlayerStorageValue(cid, 4532324) > 0 then
return true
end
if isMonster(cid) and string.find(getCreatureName(cid),"[LIMBO]") then
return true
end
if isPlayer(cid) and (exhaustion.check(cid, 65322) == true) then
return true
end
-- if getPlayerStorageValue(cid, 4532326) >= 1 then   ---  CHECK
-- return doPlayerTargetCancel(cid)
-- end
-- if getPlayerStorageValue(cid, 78632) > 0 then   ---  CHECK
-- return doPlayerTargetCancel(cid)
-- end
return false
end


function onAttack(cid, target)
if BlockAttack(cid) and BlockAttack(target) then
return false
end
return true
end

function onTarget(cid, target)
if BlockAttack(cid) and BlockAttack(target) then
return false
end
return true
end

function onCombat(cid, target)
if BlockAttack(cid) and BlockAttack(target) then
return false
end
return true
end