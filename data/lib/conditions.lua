permanentinvisible = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(permanentinvisible, CONDITION_PARAM_TICKS, -1)


C_HEALTH = 4
C_CHAKRA = 6
C_SPEED = 9
C_FIST = 20
C_GLOVE = 21
C_SWORD = 22
C_DISTANCE  = 24
C_DIST  = 24
C_SHIELD  = 25
C_NINJUTSU = 30
C_MAXHEALTHPERCENT = 31
C_MAXMANAPERCENT = 32
C_NINJUTSUPERCENT = 34
C_FISTPERCENT = 36
C_GLOVEPERCENT = 37
C_SWORDPERCENT = 38
C_DISTANCEPERCENT  = 40
C_SHIELDPERCENT  = 41
C_BUFF = 44
C_SUBID = 45

local strings = {
[C_NINJUTSU] = "+%d Ninjutsu",
[C_SHIELD] = "+%d Shield",
[C_DISTANCE] = "+%d Dist",
[C_FIST] = "+%d Agility",
[C_SWORD] = "+%d Sword",
[C_GLOVE] = "+%d Glove",
}


B_SKILL = 1
B_REGEN = 2
B_SPEED = 3

buffs = {
[B_SKILL] = {[1] = createConditionObject(CONDITION_ATTRIBUTES, false ,false, 1),
             [2] = createConditionObject(CONDITION_ATTRIBUTES, false ,false, 2),
			 [3] = createConditionObject(CONDITION_ATTRIBUTES, false ,false, 3),
			 [4] = createConditionObject(CONDITION_ATTRIBUTES, false ,false, 4),
			 [5] = createConditionObject(CONDITION_ATTRIBUTES, false ,false, 5)
            },
[B_REGEN] = {[1] = createConditionObject(CONDITION_REGENERATION, false ,false, 1),
             [2] = createConditionObject(CONDITION_REGENERATION, false ,false, 2),
			 [3] = createConditionObject(CONDITION_REGENERATION, false ,false, 3),
			 [4] = createConditionObject(CONDITION_REGENERATION, false ,false, 4),
			 [5] = createConditionObject(CONDITION_REGENERATION, false ,false, 5)
            },
[B_SPEED] = {[1] = createConditionObject(CONDITION_HASTE, false ,false, 1),
             [2] = createConditionObject(CONDITION_HASTE, false ,false, 2),
			 [3] = createConditionObject(CONDITION_HASTE, false ,false, 3),
			 [4] = createConditionObject(CONDITION_HASTE, false ,false, 4),
			 [5] = createConditionObject(CONDITION_HASTE, false ,false, 5)
            }
}


local function creatureTextColor(cid, str, color, value)
return isCreature(cid) and doSendAnimatedText(getCreaturePosition(cid), string.format(str, value), color)
end

local reset = {C_FIST, C_GLOVE, C_SWORD, C_DIST, C_SHIELD, C_NINJUTSU}
local function resetSkillsID(id)
    for _, skillid in pairs (reset) do
    setConditionParam(buffs[B_SKILL][id], skillid, 0)
    end
	setConditionParam(buffs[B_REGEN][id], C_HEALTH, 0)
	setConditionParam(buffs[B_SPEED][id], CONDITION_PARAM_SPEED, 0)
end

function doCreatureAddBuff(cid, skills, health, speed, tempo, subID)
local subID = subID or 1
resetSkillsID(subID)
local tempo = (tempo or 60) * TIME_SECONDS
-- skills
for _, skill in pairs(skills) do
setConditionParam(buffs[B_SKILL][subID], skill[1], skill[2])
addEvent(creatureTextColor, _ *400, cid, strings[skill[1]], COLOR_WHITE, skill[2])
end
setConditionParam(buffs[B_SKILL][subID], CONDITION_PARAM_SUBID, subID)
setConditionParam(buffs[B_SKILL][subID], CONDITION_PARAM_TICKS, tempo)
doAddCondition(cid, buffs[B_SKILL][subID])

-- regen
if health > 0 then
setConditionParam(buffs[B_REGEN][subID], CONDITION_PARAM_TICKS, tempo)
setConditionParam(buffs[B_REGEN][subID], C_HEALTH, health)
setConditionParam(buffs[B_REGEN][subID], C_SUBID, subID)
doAddCondition(cid, buffs[B_REGEN][subID])
end

-- speed
if speed > 0 then
setConditionParam(buffs[B_SPEED][subID], CONDITION_PARAM_TICKS, tempo)
setConditionParam(buffs[B_SPEED][subID], CONDITION_PARAM_SPEED, speed)
setConditionParam(buffs[B_SPEED][subID], CONDITION_PARAM_SUBID, subID)
doAddCondition(cid, buffs[B_SPEED][subID])
end
return true
end

function AddBuff(cid, skill, speed, health, attr, subID, tempo)
doCreatureAddBuff(cid, {{C_NINJUTSU, skill}, {attr, skill+5}}, health, speed, tempo, subID)
return true
end

function isBuffed(cid, sto, conditionID)
return (getPlayerStorageValue(cid, sto) > 0 and getCreatureCondition(cid, CONDITION_ATTRIBUTES, conditionID))
end

function isBuffID(cid, conditionID)
return getCreatureCondition(cid, CONDITION_ATTRIBUTES, conditionID) or getCreatureCondition(cid, CONDITION_REGENERATION, conditionID) or getCreatureCondition(cid, CONDITION_HASTE, conditionID)
end

function EffectBuffAll(cid, effect, reg_pos, sto, summon, SubID)
if isCreature(cid) and isBuffID(cid, SubID) and exhaustion.check(cid, 12125) == false and getCreatureOutfit(cid).lookType ~= 961 then
local mPos = getCreaturePosition(cid)
doSendMagicEffect(reg_pos and {x=mPos.x+reg_pos[1], y=mPos.y+reg_pos[2], z=mPos.z} or mPos, effect)
    for _, summon in ipairs(getCreatureSummons(cid)) do
         if getCreatureName(cid) == getCreatureName(summon) then
         local sPos = getCreaturePosition(summon)
         doSendMagicEffect(reg_pos and {x=sPos.x+reg_pos[1], y=sPos.y+reg_pos[2], z=sPos.z} or sPos, effect)
         end
	end 
end
end

function createLoopEffectBuff(cid, duration, effect, adjust, delay_effect, summon, subID)
    delay = 0
    while (delay ~= (duration * TIME_SECONDS)) do
    addEvent(loopEffectBuff, delay, cid, effect, adjust, summon, subID)
    delay = delay + delay_effect
    end
end

function loopEffectBuff(cid, effect, reg_pos, summon, subID)
if isCreature(cid) and isBuffID(cid, subID) and getCreatureOutfit(cid).lookType ~= 961 then
    local mPos = getCreaturePosition(cid)
    doSendMagicEffect(reg_pos and {x=mPos.x+reg_pos[1], y=mPos.y+reg_pos[2], z=mPos.z} or mPos, effect)
	for _, summon in ipairs(getCreatureSummons(cid)) do
         if getCreatureName(cid) == getCreatureName(summon) then
         local sPos = getCreaturePosition(summon)
         doSendMagicEffect(reg_pos and {x=sPos.x+reg_pos[1], y=sPos.y+reg_pos[2], z=sPos.z} or sPos, effect)
         end
	end
end
end
