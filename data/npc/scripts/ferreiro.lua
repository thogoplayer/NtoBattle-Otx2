local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'sim')) then
selfSay('Acredito que tenha interesse em juntar os 3 aneis (red, blue e green) {certo}?, muitas pessoas vem aqui diaramente pedindo isto ultimamente.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'certo')) then
selfSay('Voce ja tem os 3 rings para "concluir"?, lembrando que cobro uma taxa de 200 JP Ienes!', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'concluir') and talkState[talkUser] == 1) then
if(getPlayerItemCount(cid, 11682) >= 1) and (getPlayerItemCount(cid, 11198) >= 1)and (getPlayerItemCount(cid, 11199) >= 1) and (doPlayerRemoveItem(cid, 2160, 200) == TRUE) then

doPlayerRemoveItem(cid, 11682, 1)
doPlayerRemoveItem(cid, 11198, 1)
doPlayerRemoveItem(cid, 11199, 1)
doPlayerAddItem(cid,10300,1)
selfSay('muito bem aqui esta, fusion ring é um otimo nome não é mesmo hahaha, volte sempre amigo', cid)
else
selfSay('voce precisa ter os 3 aneis diferentes e 200 Jp Ienes, sem os aneis e o pagamento nao posso fazer nada, lamento.', cid)
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())