local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_TAIJUTSUDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, true)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25, 1, -30, 1)

local function damage(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local config = {
cd = 120,
storage = 663563,
efeitoDamage = 134, -- efeito q ira aparecer ao hitar no alvo
hits = 10, -- quantos hits vai dar
delay = 100, -- intervalo de tempo a cada hit
}



local function removeGhost(cid)
if isCreature(cid) then
    if isPlayerGhost(cid) then
    doCreatureExecuteTalkAction(cid, "/ghost", true, CHANNEL_SPELL)
    end
setPlayerGroupId(cid, 1)
end
end

local function excuteComand(cid, count)
if isCreature(cid) then
    if count > 0 then
    doCreatureExecuteTalkAction(cid, "/ghost", true, CHANNEL_SPELL)
    addEvent(excuteComand, config.delay, cid, count -1)
	else
	addEvent(removeGhost, 100, cid)
    end
end
end

local function hitDamage(cid, target, markpos, hits, parameters)
    if not isCreature(cid) then return true end
    if not isCreature(target) or hits < 1 then
        doTeleportThing(cid, markpos, true)
        return true
    end
    posAv = validPos(getThingPos(target))
    rand = #posAv == 1 and 1 or #posAv - 1
	effect(target, {1,1}, config.efeitoDamage)
    doTeleportThing(cid, posAv[math.random(1, rand)], true)
    damage(parameters)
    addEvent(hitDamage, config.delay, cid, target, markpos, hits - 1, parameters)
end

function onCastSpell(cid,var)
if isSelado(cid) then return false end
if isPlayer(cid) and exhaustion.check(cid, config.storage) then
return false
end

setPlayerGroupId(cid, 2)
excuteComand(cid, config.hits)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var}
hitDamage(cid, target, getThingPos(cid), config.hits, parameters)
exhaustion.set(cid, config.storage, config.cd)
return true
end