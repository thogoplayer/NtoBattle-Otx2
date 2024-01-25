function onLogin(cid)
	registerCreatureEvent(cid, "FireStormBatle")
	if isInRange(getPlayerPosition(cid), Fire.arena[1], Fire.arena[2]) then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end
	return true
end
function onCombat(cid, target)
if isPlayer(cid) and isPlayer(target) and isInRange(getPlayerPosition(cid), Fire.arena[1], Fire.arena[2]) then
	doPlayerSendCancel(cid, "You may not attack this player.")
	return false
end
return true
end