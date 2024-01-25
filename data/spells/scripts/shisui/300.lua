local combat2 = createCombatObject(cid)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -58, 1, -62, 1)

local function onCastSpell2(parameters, cid)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 2.0
local storage = 774372

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 400, cid, {2, 1}, 325)
addEvent(effect, 800, target, {1, -2}, 389)
addEvent(effect, 1100, target, {2, 3}, 479)

local c_Pos = getCreaturePosition(cid)
doSendMagicEffect({x=c_Pos.x+2, y=c_Pos.y+1, z=c_Pos.z}, 324)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 1000, parameters)
return true
end 