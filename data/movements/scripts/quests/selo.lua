function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and  getPlayerStorageValue(cid, 18218) < 1 then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Voce não tem permissão para entrar aqui")
return false
end

doTeleportThing(cid, {x = 2911, y = 1564, z = 11})
return true
end