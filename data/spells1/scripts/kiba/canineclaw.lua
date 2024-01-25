local combat_lv1 = createCombatObject()
setCombatParam(combat_lv1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat_lv1, COMBAT_PARAM_EFFECT, 121)
setAttackFormula(combat_lv1, COMBAT_FORMULA_LEVELMAGIC, 27.5, 1, 27.2, 1)

local combat_lv2 = createCombatObject()
setCombatParam(combat_lv2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat_lv2, COMBAT_PARAM_EFFECT, 201)
setAttackFormula(combat_lv2, COMBAT_FORMULA_LEVELMAGIC, 32.5, 1, 32.2, 1)

local combat_lv3 = createCombatObject()
setCombatParam(combat_lv3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat_lv3, COMBAT_PARAM_EFFECT, 91)
setAttackFormula(combat_lv3, COMBAT_FORMULA_LEVELMAGIC, 36.5, 1, 36.2, 1)

local area_lv1 = createCombatArea({
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1}
})

local area_lv2 = createCombatArea({
        {1, 1, 1},
        {1, 1, 1},
        {1, 3, 1},
        {1, 1, 1},
        {1, 1, 1}
})

local area_lv3 = createCombatArea({
        {0, 0, 0, 0, 0},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1},
        {0, 0, 0, 0, 0}
})

setCombatArea(combat_lv1, area_lv1)
setCombatArea(combat_lv2, area_lv2)
setCombatArea(combat_lv3, area_lv3)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat_lv1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat_lv2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat_lv3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local spell_storage = 48331

if getPlayerStorageValue(cid, spell_storage) < 150 then
addEvent(onCastSpell1, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 150 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Its barrier kindling progressed to level 2")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 150 and getPlayerStorageValue(cid, spell_storage) < 350 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 350 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Its barrier kindling progressed to level 3")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 350 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end
return true
end