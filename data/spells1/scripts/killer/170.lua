local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_RAITONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 132)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -35, 1, -40, 1)

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local position2 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position2, 369)
addEvent(onCastSpell2, 500, parameters)
return true
end 