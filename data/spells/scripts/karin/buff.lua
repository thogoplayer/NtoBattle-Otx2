local tempo = 60 -- tempo em segundos. 
local effect = {341}   -- efeito que fica durante o uso
local effect2 = 494 -- efeito que dará ao iniciar
local ml = 25 -- quantos ira aumentar o skill de ML
local skilldistance = 0 -- quantos ira aumentar o skill de distance
local skillsword = 0 -- quantos ira aumentar o skill de sword
local skillglove = 15 -- quantos ira aumentar o skill de Glove
local skillshield = 20 -- quantos ira aumentar o skill de Shield
local health = 1000 -- A cada 1 segundo quantos aumentar de vida
local speed = 40
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 100)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, C_GLOVE, skillglove)
setConditionParam(condition, C_SWORD, skillsword)
setConditionParam(condition, C_DISTANCE, skilldistance)
setConditionParam(condition, C_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)

     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)
                  
function onCastSpell(cid, var)
local waittime = 165
local storageBuff = 102053
local mpos = getPlayerPosition(cid)

if not getCreatureCondition(cid, CONDITION_ATTRIBUTES, 100) then
    doCombat(cid, combat, var)
    doCreatureSay(cid, "Kanchi No Jutsu", TALKTYPE_MONSTER)
	tempo2 = 0
	while (tempo2 ~= (tempo*1000)) do
        addEvent(EffectBuffAll, tempo2,cid, effect[1], false, storageBuff, true, 1)
        tempo2 = tempo2 + 600
    end
	
	setPlayerStorageValue(cid, storageBuff,1)
	doSendMagicEffect({x = mpos.x, y = mpos.y, z = mpos.z}, effect2) 
	
	local position = getCreaturePosition(cid)

local skills = {
    {"+"..skillsword.." Sword", skillsword},
    {"+"..skillglove.." Glove", skillglove},
    {"+"..skilldistance.." Distance", skilldistance},
    {"+"..ml.." Ninjutsu", ml},
    {"+"..skillshield.." Shield", skillshield}
}

for i, skill in ipairs(skills) do
    if skill[2] > 0 then
        doSendAnimatedText(position, skill[1], COLOR_WHITE)
    end
end

return true
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
return false
end
end