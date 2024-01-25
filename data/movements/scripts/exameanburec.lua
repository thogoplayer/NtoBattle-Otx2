function onStepIn(cid, item, position, fromPosition)
local storage = 89745
local fromPos,toPos = {x=1020,y=804,z=7},{x=1046,y=871,z=7}
local fromPos2,toPos2 = {x=1027,y=811,z=7},{x=1035,y=820,z=7}

if (not(getPlayerStorageValue(cid, 40000) == 54)) then
doPlayerPopupFYI(cid, "Voce nao pertence a esta Saga")
return false
end

if item.actionid == 28534 and getPlayerStorageValue(cid, storage) < 3 then
doTeleportThing(cid, fromPosition, true)
doCreatureSay(cid, "Somente Shinobis com graduação Jounin podem fazer o Exame Anbu!", TALKTYPE_MONSTER)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
for x = fromPos.x, toPos.x do
for y = fromPos.y,toPos.y do
local m = getTopCreature({x=x, y=y, z=fromPos.z}).uid
for xx = fromPos2.x, toPos2.x do
for yy = fromPos2.y,toPos2.y do
local mm = getTopCreature({x=xx, y=yy, z=fromPos.z}).uid
if m~= 0 and isPlayer(m) or mm~= 0 and isPlayer(mm) then
doTeleportThing(cid, fromPosition, true)
return doPlayerSendCancel(cid, "Alguem esta fazendo o teste, espere ele terminar.")
end
end
end
end
end
return true
end