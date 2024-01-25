local selo_effect = 152 -- Efeito do selo que vai sair em cima do monstro selando ele.

function onCastSpell(cid, var)
if getPlayerStorageValue(cid, jin_Storage) <= 0 then
 if isMonster(getCreatureTarget(cid)) then
  if jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()] then
   if getCreatureHealth(getCreatureTarget(cid)) <= getCreatureMaxHealth(getCreatureTarget(cid))/100*jin_percentHp then
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você agora é Jinchuuriki do "..getCreatureName(getCreatureTarget(cid)):gsub("^%l", string.upper)..", use tamanho poder com sabedoria!!")
    jin.setPlayerBijuu(cid, jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()].sto)
    jin.setBijuuTime(cid, jin_TimeDay)
    jin.doPlayerSetSpells(cid, jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()].spells)
	doSendMagicEffect(getThingPosition(getCreatureTarget(cid)), selo_effect)
    doRemoveCreature(getCreatureTarget(cid))
    return true
   else
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você só pode selar o bijuu quando o hp dele estiver menor ou igual a "..jin_percentHp..".")
   end
  else 
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Esse monstro não é um Bijuu.")   
  end
 else
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você só pode selar as Bijuus como Jinchuuriki.")
 end 
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não pode selar mais bijuu, atualmente você é Jinchuuriki do "..jin.getPlayerBijuu(cid)..", espere o tempo acabar.")
end
return false
end