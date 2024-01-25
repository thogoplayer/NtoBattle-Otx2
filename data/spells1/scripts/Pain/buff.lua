local tempo = 180 -- tempo em segundos.

local ml = 150 -- quantos ira aumentar o skill de ML
local skillfist = 5 -- quantos ira aumentar o skill de Fist
local skillsword = 5 -- quantos ira aumentar o skill de Sword
local skillaxe = 5 -- quantos ira aumentar o skill de Axe
local skillclub = 5 -- quantos ira aumentar o skill de Club
local skilldistance = 80 -- quantos ira aumentar o skill de Distance
local skillshield = 50 -- quantos ira aumentar o skill de Shield
local health = 400 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 500)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

function magicEffect126(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getCreatureCondition(cid, CONDITION_REGENERATION, 1) then

            doSendMagicEffect(getPlayerPosition(cid), 126)
        end
    end
end

function onCastSpell(cid, var)
if getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect126, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    doPlayerSendCancel(cid, "desculpe-me, voce ja esta transformado.")
end
end