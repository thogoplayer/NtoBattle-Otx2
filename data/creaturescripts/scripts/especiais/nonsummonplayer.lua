function onCombat(cid, target)
if cid == getCreatureMaster(target) then
doPlayerSendCancel(cid, "You can't attack your summon.")
return false
end
return true
end