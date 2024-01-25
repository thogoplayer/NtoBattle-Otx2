function onStepIn(cid, item, position, fromPosition)
if not isPlayer(cid) then return true end
local sagaInfo = getSagaInfo(cid)
if sagaInfo.saga < 10 then
doPlayerSendCancel(cid, "[SAGA SYSTEM] You don't belong in this saga")
doTeleportThing(cid, fromPosition)
return false
end

if sagaInfo.saga == 10 then
    if getPlayerSaga(cid, 10, 6) then
    doPlayerNextSaga(cid)
    end
elseif sagaInfo.saga == 12 then
    if sagaInfo.missao == 1 then
    doTeleportThing(cid, {x= 1224, y=2594, z= 5})
    elseif sagaInfo.missao == 3 then
    doTeleportThing(cid, {x= 1248, y=2654, z= 5})
    end
end

return true
end