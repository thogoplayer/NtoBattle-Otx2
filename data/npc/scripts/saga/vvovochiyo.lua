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
    if not getPlayerSaga(cid, 9,5) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] N�o posso falar com voc� neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Ol� " .. getCreatureName(cid) .. ". Preciso de sua ajuda,  o Gaara infelizmente morreu e preciso do seu \nchakra para reviver-lo, voc� pode ajudar?.", {"Fechar", "Ajudar", "Nao"})
    return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"ajudar"}, msg) then
-- npcHandler:say("Preciso apenas que voc� {transmita} seu chakra para o corpo dele!!", cid)
sendNpcDialog(cid, getNpcCid(), "Preciso apenas que voc� transmita seu chakra para o corpo dele!!", {"Fechar", "Transmitir"})  
setPlayerStorageValue(cid,16332, 0)
doPlayerNextSaga(cid)
removeSummons(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "transmitir" then  
-- selfSay("Basta voc� clicar com o bot�o direito do mouse no corpse", cid)  
sendNpcDialog(cid, getNpcCid(), "Basta voc� clicar com o bot�o direito do mouse no corpo do gaara", {"Fechar"})  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid) 
elseif msg == "nao" then  
-- selfSay("Covarde vai deixar o kazekage morrer mermao tu ta maluco �?", cid)
sendNpcDialog(cid, getNpcCid(), "Covarde vai deixar o kazekage morrer? tu n�o tem um bom cora��o?", {"Fechar"})  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())