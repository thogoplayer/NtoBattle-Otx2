-- local combat = createCombatObject()
-- setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---balanço nivel 170
-- setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10, 1, -11.6, 1)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
-- setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)

-- arr = {
-- {0, 0, 0, 0, 0, 0, 0},
-- {0, 0, 0, 0, 0, 0, 0},
-- {0, 0, 1, 1, 1, 0, 0},
-- {0, 0, 1, 3, 1, 0, 0},
-- {0, 0, 1, 1, 1, 0, 0},
-- {0, 0, 0, 0, 0, 0, 0},
-- {0, 0, 0, 0, 0, 0, 0}
-- }

-- local area = createCombatArea(arr)
-- setCombatArea(combat, area)

-- function onCastSpell(cid, var) 
-- if isSelado(cid) then return false end
-- local waittime = 1.0
-- local storage = 665778

-- if isPlayer(cid) and exhaustion.check(cid, storage) then
-- doPlayerSendCancel(cid, "Voce esta exausto.")
-- doSendMagicEffect(getCreaturePosition(cid), 2)
-- return false
-- end

-- local p = getCreaturePosition(cid)
-- local x = {
-- [0] = {x=p.x+1, y=p.y+1, z=p.z},
-- [1] = {x=p.x+1, y=p.y+1, z=p.z},
-- [2] = {x=p.x+1, y=p.y+1, z=p.z},
-- [3] = {x=p.x+1, y=p.y+1, z=p.z}
-- }
-- local y = {
-- [0] = 562,
-- [1] = 562,
-- [2] = 563,
-- [3] = 563
-- }
-- pos = x[getCreatureLookDirection(cid)]
-- eff = y[getCreatureLookDirection(cid)]
-- doSendMagicEffect(pos, eff)
-- addEvent(doSendMagicEffect,200,pos, eff)
-- addEvent(doSendMagicEffect,400,pos, eff)
-- addEvent(doSendMagicEffect,600,pos, eff)
-- exhaustion.set(cid, storage, waittime)
-- doCombat(cid, combat, var)
-- addEvent(doCombat,200,cid, combat, var)
-- addEvent(doCombat,400,cid, combat, var)
-- addEvent(doCombat,600,cid, combat, var)
-- return true
-- end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)	---ataque nivel 170
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -39, 1, -42, 1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 1.5
local storage = 665778

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

addEvent(effect, 100, target, {0, 1}, 562)
addEvent(effect, 100, target, {2, 1}, 563)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell1, 100, parameters)
return true
end 