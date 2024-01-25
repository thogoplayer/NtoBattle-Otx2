function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid, 45243) >= 1 then
doTeleportThing(cid, toPosition)
elseif getPlayerStorageValue(cid, 45243) < 0 and (getPlayerItemCount(cid, 11467) >= 1) then
setPlayerStorageValue(cid,45243,1)
doTeleportThing(cid, toPosition)
doPlayerRemoveItem(cid, 11467, 1)
else
doPlayerSendCancel(cid, "Voce precisa do Danzou Eye para liberar sua entrada na quest")
end
return true
end