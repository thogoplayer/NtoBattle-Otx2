function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and  getPlayerStorageValue(cid, 18213) < 1 then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Voce não tem permissão para entrar aqui")
return false
end

doTeleportThing(cid, {x = 1882, y = 2469, z = 8})
return true
end