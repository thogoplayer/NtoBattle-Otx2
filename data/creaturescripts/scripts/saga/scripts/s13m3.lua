local function showEffects(cid, pos , rounds)
if isCreature(cid) then
if rounds > 0 then
doSendMagicEffect(pos, 182, cid)
doSendMagicEffect({x=pos.x-3 ,y=pos.y-2 ,z=pos.z}, 182, cid)
doSendMagicEffect({x=pos.x+3 ,y=pos.y-2 ,z=pos.z}, 182, cid)
doSendMagicEffect({x=pos.x-3 ,y=pos.y+2 ,z=pos.z}, 182, cid)
doSendMagicEffect({x=pos.x+3 ,y=pos.y+2 ,z=pos.z}, 182, cid)
addEvent(showEffects, 300, cid, pos , rounds - 1)
else
doTeleportThing(cid, {x= 2756, y=3507, z= 1})
end
end
end



function onTarget(cid, target)
if getCreatureName(target) == "   Itachi" then
if (isPlayer(cid)) and (isMonster(target)) and getPlayerSaga(cid, 13, 3) then
local waittime = 3.0 -- Tempo de exhaustion
local storage = 435621

if exhaustion.check(cid, storage) then
return false
end

if getDistanceBetween(getPlayerPosition(cid), getPlayerPosition(target)) <= 2 then
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(getCreaturePosition(target), 258, cid)
addEvent(function()
                    if isCreature(cid) then
					doTeleportThing(cid, {x=2067 ,y=2281 ,z=9})
					showEffects(cid, {x=2067 ,y=2281 ,z=9} , 15)
					unregisterCreatureEvent(cid, "SagaItachiGen")
                    end
                end, 1000)
end
return false
end
return false
end
return true
end


function onStatsChange(cid, attacker, type, combat, value)
if getCreatureHealth(cid) <= (getCreatureMaxHealth(cid)/2) then
doCreateMonster("    Itachi ", getThingPos(cid))
doRemoveCreature(cid)
return false
end
return true
end