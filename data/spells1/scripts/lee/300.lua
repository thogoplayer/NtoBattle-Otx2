local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)		---balanço nivel 300
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -30, 1, -35, 1)
setCombatParam(combat2, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, false)

local function onCastSpell2(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function effect(uid)
if isCreature(uid) then
local t_Pos = getCreaturePosition(uid)
doSendMagicEffect({x=t_Pos.x+3, y=t_Pos.y+3, z=t_Pos.z}, 1109)
end
end
 
function onCastSpell(cid, var) 
if isSelado(cid) then return false end
local waittime = 4.0
local storage = 774372
local time = 1

if exhaustion.check(cid, storage) then
return false
end
local c_Pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}

doTeleportThing(cid,getCreaturePosition(target))
Trap(target, time)
addEvent(effect, 100, target)
exhaustion.set(cid, storage, waittime)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
doSendMagicEffect({x = c_Pos.x+2, y = c_Pos.y+1, z = c_Pos.z}, 1108)
return true
end 