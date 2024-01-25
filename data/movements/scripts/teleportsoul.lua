function onStepIn(cid, item, toPosition, fromPosition)
if getPlayerSoul(cid) >= 50 then
   doTeleportThing(cid, {x= 2031, y=2042, z= 7})
else
   doPlayerSendCancel(cid, "MENSAGEM AQUI")

return true
end
return true
end