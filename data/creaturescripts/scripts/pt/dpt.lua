function onCombat(cid, target)
if isPlayer(cid) and isInParty(cid) and isPlayer(target) and isInParty(target) and getPlayerParty(cid) == getPlayerParty(target) then
doPlayerSendCancel(cid, "You can not attack your party members")
return false
else
return true
end
end