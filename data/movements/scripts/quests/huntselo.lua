function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and  getPlayerStorageValue(cid, 18216) < 1 then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Voce não tem permissão para entrar aqui")
return false
end

doTeleportThing(cid, {x = 1482, y = 1588, z = 10})
return true
end