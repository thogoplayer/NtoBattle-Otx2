function buff_bijuu(cid, pointsSkill, time, subId)

local buff_bijuu = createConditionObject(CONDITION_ATTRIBUTES)
 setConditionParam(buff_bijuu, CONDITION_PARAM_TICKS, time*1000)
 setConditionParam(buff_bijuu, CONDITION_PARAM_STAT_MAGICLEVEL, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_FIST, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_SWORD, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_AXE, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_CLUB, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_DISTANCE, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SKILL_SHIELD, pointsSkill)
 setConditionParam(buff_bijuu, CONDITION_PARAM_SUBID, subId)
return doAddCondition(cid, buff_bijuu)
end

local function RemoveBuff(cid) 
if isPlayer(cid) then
 setPlayerStorageValue(cid, 10215, 0)
end
return true
end

function onCastSpell(cid, var)
local waittime = 180.0
local storage = 89923

if isPlayer(cid) and exhaustion.check(cid, storage) then
return false
end

if isSeleadBijuu(cid) then return false end

local storag2 = 10215
 if jin.getPlayerBijuu(cid) ~= 0 then
  if not getCreatureCondition(cid, CONDITION_ATTRIBUTES, jin_cond_id) then
   doSetCreatureOutfit(cid, {lookType = jin_bijuus[jin.getPlayerBijuu(cid):lower()].bijuu_outfit} , jin_bijuus[jin.getPlayerBijuu(cid):lower()].time_buff*1000)
   buff_bijuu(cid, jin_bijuus[jin.getPlayerBijuu(cid):lower()].skill_p, jin_bijuus[jin.getPlayerBijuu(cid):lower()].time_buff, jin_cond_id)
   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Bijuu Buff Mode Ativado!!")
   setPlayerStorageValue(cid, storag2, 1)
   exhaustion.set(cid, storage, waittime)
   addEvent(RemoveBuff, 30*1000, cid)
   local position = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
   doSendMagicEffect(position, jin_bijuus[jin.getPlayerBijuu(cid):lower()].effBuff)
  else
   return false, doPlayerSendCancel(cid, "Você ja esta com o buff de sua bijuu.")
  end
 else
  return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você precisa possuir alguma bijuu para usar este buff.")
 end
  return true
end