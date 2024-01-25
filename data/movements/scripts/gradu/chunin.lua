function onStepIn(cid, item, position, fromPosition)

if not isPlayer(cid) then doTeleportThing(cid, fromPosition) return false end
local gradu = CHUNIN

if getPlayerGraduationId(cid) < gradu then
doPlayerSendCancel(cid, "É necessario estar na graduação "..TIER_TYPES[gradu].desc.." ou superior.")
return false
end

return true
end