local tempo = 60 -- tempo em segundos.
local effect = {406} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
     
local skillpoint = 15 -- quantos ira aumentar o skill
local health = 100 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skillpoint)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillpoint)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)
            
function buffmadara(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 102053) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=1, #effect do 
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect[i])
-- parte modificada
local summons = getCreatureSummons(cid)
if #summons > 0 then
for k = 1, #summons do
if getCreatureName(cid) == getCreatureName(summons[k]) then
local pos = getCreaturePosition(summons[k])
local positions = {x = pos.x, y = pos.y, z = pos.z}
doSendMagicEffect(positions, effect[i])
end
end
end 
-- fim da parte modificada
        end
    end
end
end
                  
function onCastSpell(cid, var)
local position129 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 102053) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(buffmadara, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 102053,1) -- storage verifica transformado, quando = 1 player esta transformado.
    doCreatureSay(cid, "Fuumetsu Mangekyou Sharingan", TALKTYPE_MONSTER)
    doSendMagicEffect(position129, 254)
else
    doPlayerSendCancel(cid, "desculpe-me, voce ja esta transformado.")
end
end