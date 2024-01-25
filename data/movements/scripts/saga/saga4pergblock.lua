function onStepIn(cid, item, position, fromPosition)

if isPlayer(cid) and (getPlayerItemCount(cid, 12281) < 1 or getPlayerItemCount(cid, 12282) < 1)  then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Get both scrolls.")
return false
end

return true
end