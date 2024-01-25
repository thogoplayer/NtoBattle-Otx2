local function doPushCreature(target, cid)
    if not isCreature(target) then return false end
    local position = getThingPosition(cid)
    local fromPosition = getThingPosition(target)
    local x = (fromPosition.x > position.x and 1 or fromPosition.x < position.x and -1 or 0)
    local y = (fromPosition.y > position.y and 1 or fromPosition.y < position.y and -1 or 0)
    local toPosition = {x = fromPosition.x + x, y = fromPosition.y + y, z = fromPosition.z}
        if isWalkable(toPosition) then
        doTeleportThing(target, toPosition, true)
        end
    end

local config = {
storage = 82223,
cd = 2,
}



local spell = {}
spell.config = {
    [3] = {
   damageType = 1,
   areaEffect = 2,
   area = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   }   
    },
    [2] = {
   damageType = 1,
   areaEffect = 2,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 1, 0, 2, 0, 1, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    },
    [1] = {
   damageType = 1,
   areaEffect = 2,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 2, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    }
}
  
spell.combats = {}
for _, config in ipairs(spell.config) do
    local combat = createCombatObject()
    setCombatParam(combat, COMBAT_PARAM_TYPE, config.damageType)
    setCombatParam(combat, COMBAT_PARAM_EFFECT, config.areaEffect)
    setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -4, 0, -4.7, 0)
    function onTargetCreature(cid, target)
	if not isNpc(target) then
    doPushCreature(target, cid)
	end
    end
    setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
    setCombatArea(combat, createCombatArea(config.area))
    table.insert(spell.combats, combat)
end

function onCastSpell(cid, var)
if isSelado(cid) then return false end
if isPlayer(cid) and exhaustion.check(cid, config.storage) then
return false
end

if getCreatureIn(cid, AREA_TRAINER) or getCreatureIn(cid, AREA_EVENT) then
doPlayerSendCancel(cid, "Você nao pode usar esse jutsu aqui!!")
return false
end

    for n = 1, #spell.combats do
    addEvent(doCombat, (n * 120), cid, spell.combats[n], var)
    end
	effect(cid, {1,0}, 964)
	exhaustion.set(cid, config.storage, config.cd)
    return true
end