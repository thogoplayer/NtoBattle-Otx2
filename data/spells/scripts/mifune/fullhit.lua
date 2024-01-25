local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -30, 1, -40, 1)

local combatCrit = createCombatObject()
setCombatParam(combatCrit, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)
setCombatParam(combatCrit, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combatCrit, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combatCrit, COMBAT_FORMULA_LEVELMAGIC, -9999, 1, -9999, 1)

local function damage(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function critico(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combatCrit, parameters.var)
end

local config = {
storage = 663344,
cd = 60.0,
chanceCrit = 15,
hits = 5,
}


local function hit(params, countHit)
if isCreature(params.cid) and isCreature(params.target) and getCreatureTarget(params.cid) == params.target then
    if isPlayer(params.target) and (getCreatureHealth(params.target) <= getCreatureMaxHealth(params.target)/10) and config.chanceCrit >= math.random(1,100) then
    critico(params)
    else
    damage(params)
    end
	effect(params.target, {1,1}, 688)
    if countHit > 1 then
    addEvent(hit, 2000, params, countHit-1)
    end
end
end



function onCastSpell(cid, var) 
if isSelado(cid) then return false end
if isPlayer(cid) and exhaustion.check(cid, config.storage) then
return false
end

local parameters = { cid = cid, var = var, target = getCreatureTarget(cid)}
hit(parameters, config.hits)
exhaustion.set(cid, config.storage, config.cd)
return true
end 