function onCastSpell(cid, var)
local chance = 40
local selo_effect = 238 -- Efeito do selo que vai sair em cima do monstro selando ele.
local waittime = 3600-- Tempo de exhaustion
local storage = 61533

if isPlayer(cid) and exhaustion.check(cid, storage) then
local seetime = exhaustion.get(cid, storage)
doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar a Kekkei Genkai Shiki Fuujin novamente.")
return false
end


if getPlayerStorageValue(cid, jin_Storage) > 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não pode selar mais bijuu, atualmente você é Jinchuuriki do "..jin.getPlayerBijuu(cid)..", espere o tempo acabar.")
exhaustion.set(cid, storage, waittime)
return false
end
				 

         if isMonster(getCreatureTarget(cid)) then
                if jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()] then
	                     if getCreatureHealth(getCreatureTarget(cid)) <= getCreatureMaxHealth(getCreatureTarget(cid))/100*jin_percentHp then
						     exhaustion.set(cid, storage, waittime)
                             if math.random(1, 100) <= chance then
	                         doSendMagicEffect(getThingPosition(getCreatureTarget(cid)), selo_effect)
						     doBroadcastMessage("[====== Jinchuuriki System ======]\nO "..getCreatureName(getCreatureTarget(cid)).." foi Selado pelo player "..getCreatureName(cid).."")
	                         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você agora é Jinchuuriki do "..getCreatureName(getCreatureTarget(cid)):gsub("^%l", string.upper)..", use tamanho poder com sabedoria!!")
                             jin.setPlayerBijuu(cid, jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()].sto)
                             jin.setBijuuTime(cid, jin_TimeDay)
                             jin.doPlayerSetSpells(cid, jin_bijuus[getCreatureName(getCreatureTarget(cid)):lower()].spells)
						     doRemoveCreature(getCreatureTarget(cid))
	                         else
                             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Falhou.")
                            end 
                     else
                     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você só pode selar o bijuu quando o hp dele estiver menor ou igual a "..jin_percentHp..".")
                     return false
                    end
                 else 
                 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Esse monstro não é um Bijuu.")   
                 return false
                end
             else
             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você só pode selar as Bijuus como Jinchuuriki.")
             return false
            end 
return false
end