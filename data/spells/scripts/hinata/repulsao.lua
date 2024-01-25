local function doPushCreature(target, cid)
    if isCreature(cid) and isCreature(target) then
        if not isNpc(target) then
        local position = getThingPosition(cid)
        local fromPosition = getThingPosition(target)
        local x = fromPosition.x > position.x and 1 or fromPosition.x < position.x and -1 or 0
        local y = fromPosition.y > position.y and 1 or fromPosition.y < position.y and -1 or 0
        local toPosition = {x = fromPosition.x + x, y = fromPosition.y + y, z = fromPosition.z}
            if isWalkable(toPosition)  then
            doTeleportThing(target, toPosition, true)
            end
        end
    end
end

local area = {
   {1, 1, 1},
   {1, 2, 1},
   {1, 1, 1},
}
   
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, 1)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50, 0, -55, 0)

function onTargetCreature(cid, target)
doPushCreature(target, cid)
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
setCombatArea(combat, createCombatArea(area))

function onCastSpell(cid, var)
if isSelado(cid) then return false end
local waittime = 20 -- Tempo de exhaustion
local storage = 663563

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
exhaustion.set(cid, storage, waittime)
local c_Pos = getThingPos(cid)
doSendMagicEffect({x= c_Pos.x+1, y = c_Pos.y +1, z = c_Pos.z}, 826)
doCombat(cid, combat, var)
setCreatureBattleLockTime(cid, 1)
return true
end