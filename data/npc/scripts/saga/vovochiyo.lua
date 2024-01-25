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
    if not getPlayerSaga(cid, 9,2) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] N�o posso falar com voc� neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Ol� " .. getCreatureName(cid) .. ". Ainda bem que voce chegou a tempo! Ainda h� chances do Gaara estar \nvivo! Por favor salve-o das m�os da Akatsuki.", {"Fechar", "Salvar", "Nao"})
    return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"salvar"}, msg) then
-- npcHandler:say("Va atras do Deidara e do Sasori antes que seja tarde demais!!", cid)
sendNpcDialog(cid, getNpcCid(), "Va atras do Deidara e do Sasori antes que seja tarde demais!!", {"Fechar"})
doPlayerNextSaga(cid)
doTeleportThing(cid, {x = 2053, y = 4109, z = 7})
removeSummons(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "nao" then  
-- selfSay("Covarde vai deixar o kazekage morrer mermao tu ta maluco �?", cid) 
sendNpcDialog(cid, getNpcCid(), "Covarde vai deixar o kazekage morrer? que cora��o � esse que voc� tem?", {"Fechar"}) 
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())