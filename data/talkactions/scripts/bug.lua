local exausted = 985433-- Storange que o player ganha, só mexa se tiver sendo usada por outro .script seu
local tempo = 3600 
function onSay(cid, words, param)
if exhaustion.check(cid, exausted) then
local seetime = exhaustion.get(cid, exausted)
return doPlayerSendCancel(cid, "Aguarde "..math.floor(seetime/60).." minutos e "..math.floor(seetime%60).." segundos para usar !bug novamente.")
end

if getCreatureCondition(cid, CONDITION_INFIGHT) then
return doPlayerSendCancel(cid, "Você não pode desbugar em batalha.")
end

exhaustion.set(cid, exausted, tempo)
doPlayerSendTextMessage(cid,25,"Personagem Desbugado!") -- Mensagem que vai aparecer ao player, quando  usar o comando ?.
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
-- doSendMagicEffect(getCreaturePosition(cid),21) -- 21 é o efeito você escolhe outro se quiser...
return true
end