

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)	---defesa nivel 250
-- setCombatParam(combat, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
-- setCombatParam(combat2, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -45, 1, -50, 1)

local area1 = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end
local trap = 3

local function removeTrap(uid)
return effect(uid, {1,0}, 1153) and doCreatureSetNoMove(uid, false)
end

function onSelectPapper(cid, target)
doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(target), 160)
doCreatureSetNoMove(target, true)
exhaustion.set(target, 13000, trap+5)
addEvent(removeTrap, trap*1000, target)
addEvent(effect, 10, target, {1,0}, 1152)
-- exhaustion.set(target, config.storage+1, config.duration)
end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onSelectPapper")

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0
local storage = 774372


if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
onCastSpell1(parameters)
return true
end 