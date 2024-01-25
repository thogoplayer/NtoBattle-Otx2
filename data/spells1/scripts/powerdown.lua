function onCastSpell(cid, var) 
local mana = getCreatureMana(cid) 
 
if doCreatureAddMana(cid, -mana) then 
  if doPlayerAddSpentMana(cid, mana) then 
   doSendMagicEffect(getCreaturePosition(cid), 188) 
   return false 
  else 
   doCreatureAddMana(cid, mana) 
  end 
end 
 
doSendMagicEffect(getCreaturePosition(cid), 2) 
return false 
end

