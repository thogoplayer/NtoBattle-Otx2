local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end


function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not getPlayerSaga(cid, 3,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Estou impressionado " .. getCreatureName(cid) .. ", vejo que concluiu o treino do kakashi, e foi \naprovado para fazer missões da vila, e no momento eu tenho uma disponivel aqui \ndejesa fazer-la?!", {"Fechar", "Fazer"})
    return true
end

local msg = string.lower(msg)
if isInArray({"fazer","fazer-la"}, msg) then
-- npcHandler:say("Para concluir a missao voce precisa-ra ser guarda-costa do construtor da ponte em mist gakure para que ninguem o impessa de construi-la, esta mesmo {pronto} para isso?.", cid)
sendNpcDialog(cid, getNpcCid(), "Para concluir a missão voce precisará ser guarda-costa do construtor da ponte \nem mist gakure para que ninguém o atrapalhe de construi-la, está mesmo pronto \npara isso?.", {"Fechar", "Pronto"})
talkState[talkUser] = 1
elseif isInArray({"yes","pronto"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "no" then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())