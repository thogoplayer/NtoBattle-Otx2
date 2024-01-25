
local combat = createCombatObject()
local time = 60
local pointsSkill = 15
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
local buff_bijuu = createConditionObject(CONDITION_ATTRIBUTES , false, false,8)
 setConditionParam(buff_bijuu, CONDITION_PARAM_TICKS, time*1000)
 setConditionParam(buff_bijuu, CONDITION_PARAM_STAT_MAGICLEVEL, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_FIST, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_SWORD, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_AXE, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_CLUB, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_DISTANCE, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_SHIELD, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SUBID, 8)
 setCombatCondition(combat, buff_bijuu)

local pointsSkil2 = 20
 local combat2 = createCombatObject()
local buff_juubi = createConditionObject(CONDITION_ATTRIBUTES , false, false,8)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)
 setConditionParam(buff_juubi, CONDITION_PARAM_TICKS, time*1000)
 setConditionParam(buff_juubi, CONDITION_PARAM_STAT_MAGICLEVEL, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_FIST, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_SWORD, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_AXE, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_CLUB, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_DISTANCE, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SKILL_SHIELD, pointsSkil2)
 setConditionParam(buff_juubi, CONDITION_PARAM_SUBID, 8)
 setCombatCondition(combat2, buff_juubi)
 
local function RemoveBuff(cid) 
if isCreature(cid) then
 setPlayerStorageValue(cid, 'bijuuativado', 0)
end
return true
end

function onCastSpell(cid, var)
local waittime = 60.0 -- Tempo de exhaustion
local storage = 'bijuubuffativo'
local storag2 = 'bijuuativado'

if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o !bijuumode novamente.")
return false
end


 if jin.getPlayerBijuu(cid) ~= 0 then
  if not getCreatureCondition(cid, CONDITION_ATTRIBUTES, jin_cond_id) then
   doSetCreatureOutfit(cid, {lookType = jin_bijuus[jin.getPlayerBijuu(cid):lower()].bijuu_outfit} , jin_bijuus[jin.getPlayerBijuu(cid):lower()].time_buff*1000)
   if jin.getPlayerBijuu(cid) == 'Juubi boss' then
   doCombat(cid, combat2, var)
   else
   doCombat(cid, combat, var)
   end
   exhaustion.set(cid, storage, time)
   setPlayerStorageValue(cid, storag2, 1)
   addEvent(RemoveBuff, 10*1000, cid)
   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Bijuu Buff Mode Ativado!!")
   local position = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
   doSendMagicEffect(position, jin_bijuus[jin.getPlayerBijuu(cid):lower()].effBuff)
  else
   return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você já está com o buff de sua bijuu.")
  end
 else
  return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você precisa selar algum bijuu para usar seu buff.")
 end
  return true
end