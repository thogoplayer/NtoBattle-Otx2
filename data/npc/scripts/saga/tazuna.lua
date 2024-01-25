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
    if not getPlayerSaga(cid, 3,2) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ", eu sou tazuna o grande construtor de pontes, e estou prestes a \nconstruir minha melhor obra, mas para isso preciso que me protegam contra \nalguns assassinos!", {"Fechar", "Proteger"})
    return true
end

local msg = string.lower(msg)
if isInArray({"protegam","proteger"}, msg) then
-- npcHandler:say("Pois bem espero que deem o melhor de voces nesta {missao}!!.", cid)
sendNpcDialog(cid, getNpcCid(), "Pois bem espero que deem o melhor de vocês nesta missão!!.", {"Fechar", "Missao"})
talkState[talkUser] = 1
elseif isInArray({"yes","pronto","missao"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "no" then  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())