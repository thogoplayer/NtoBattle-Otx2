local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---cura nivel 200
setCombatParam(combat1, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -22, 1, -24, 1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local percent = 25 -- Em % da Chakra do alvo que será removida
local percen2 = 10 -- Em % da Chakra do alvo que será add
local target = getCreatureTarget(cid)
local damage = getCreatureMana(target) / 100 * percent
local damag2 = getCreatureMana(target) / 100 * percen2
local waittime = 1.0 -- Tempo de exhaustion
local storage = 899123

if exhaustion.check(cid, storage) then
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 423)
doCreatureAddMana(target, -damage)
doCreatureAddMana(cid, damag2)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 200, parameters)
exhaustion.set(cid, storage, waittime)
doSendMagicEffect(position1, 423)
doCombat(cid, combat1, var)
return true
end