function onStepIn(cid, item, position, fromPosition)

if (not(getPlayerVocation(cid) == 400)) then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Apenas Obitos(Premiums) podem passar por aqui")
return false
end
if not isPremium(cid) then
doPlayerSendCancel(cid, "Apenas Obitos(Premiums) podem passar por aqui")
doTeleportThing(cid, fromPosition)
end
doPlayerSendCancel(cid, "Mantenha seu premium account e tenha sempre beneficios")
return true
end