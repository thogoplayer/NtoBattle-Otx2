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

function onCastSpell(cid, var)
 if jin.getPlayerBijuu(cid) ~= 0 then
  if not getCreatureCondition(cid, CONDITION_ATTRIBUTES, jin_cond_id) then
   doSetCreatureOutfit(cid, {lookType = jin_bijuus[jin.getPlayerBijuu(cid):lower()].bijuu_outfit} , jin_bijuus[jin.getPlayerBijuu(cid):lower()].time_buff*1000)
   buff_bijuu(cid, jin_bijuus[jin.getPlayerBijuu(cid):lower()].skill_p, jin_bijuus[jin.getPlayerBijuu(cid):lower()].time_buff, jin_cond_id)
   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Bijuu Buff Mode Ativado!!")
   doSendMagicEffect(getThingPosition(cid), jin_bijuus[jin.getPlayerBijuu(cid):lower()].effBuff)
  else
   return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você já está com o buff de sua bijuu.")
  end
 else
  return false, doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você precisa selar algum bijuu para usar seu buff.")
 end
  return true
end