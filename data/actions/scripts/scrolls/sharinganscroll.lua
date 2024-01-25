function onUse(cid, item, frompos, item2, topos)

local spellName = "Shiki Fuujin" 

if getPlayerItemCount(cid,12054) < 1 then
doPlayerSendTextMessage(cid, 23, "Voce precisa ter a scroll em sua BP!.")
return true
end
if getPlayerStorageValue(cid, 1234255) < 1 then
if getPlayerStorageValue(cid, 23424) < 1 then
setPlayerStorageValue(cid, 23424, 1)
doPlayerLearnInstantSpell(cid, spellName)
doPlayerRemoveItem(cid, 12054, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você aprendeu a spell {'.. spellName ..'}.')
else
doPlayerSendTextMessage(cid, 19, "Voce ja aprendeu este Jutsu!.")
end
end
if getPlayerStorageValue(cid, 1234255) >= 1 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não pode selar mais bijuu, atualmente você é Jinchuuriki do "..jin.getPlayerBijuu(cid)..", espere o tempo acabar.")
end
return true
end

