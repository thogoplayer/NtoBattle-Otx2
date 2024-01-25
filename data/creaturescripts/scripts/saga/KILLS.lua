function onKill(cid, target)
if isPlayer(cid) and (isMonster(target)) and not getCreatureMaster(target) and SAGASYSTEM.MONSTERS[getCreatureName(target)] then
SAGASYSTEM.onKill(cid, target)
end
return true
end





