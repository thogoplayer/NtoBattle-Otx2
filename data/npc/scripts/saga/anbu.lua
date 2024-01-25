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

if not getPlayerSaga(cid, 13) then
npcHandler:say(npcHandler:getMessage(MESSAGE_SAGAERROR), cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
return true
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'shinobi')) then
selfSay('Ohh sim...verdade, de agora em diante seras chamado de {anbu}, foi muito valente por ter feito o exame.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'anbu')) then
setPlayerStorageValue(cid,89745,4)
doPlayerSendTextMessage(cid,22,"Nova Graduacao: Anbu")
setPlayerStorageValue(cid,40000, 14)
doPlayerPopupFYI(cid, '     Capitulo '..getPlayerStorageValue(cid, 40000)..' desbloquado. \n ** Destruiçao de konoha ** \n               (digite "saga")')
selfSay('Hahaha, vejo que nao sera dificil de tomar decisoes no futuro, tem potencial pra se tornar um captao anbu algum dia!', cid)
doPlayerAddItem(cid,11471,1)
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())