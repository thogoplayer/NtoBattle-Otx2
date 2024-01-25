function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and  getPlayerStorageValue(cid, 9021) < 1 then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Somente apos derrotar o dragao e obter seus equipamentos que poderá passar")
return false
end

doTeleportThing(cid, {x = 2018, y = 2352, z = 9})
return true
end