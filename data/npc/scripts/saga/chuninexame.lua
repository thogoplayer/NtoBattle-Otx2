
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
    if not getPlayerSaga(cid, 4,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "haHAha, entao achas que tens capacidade de ser um chunin " .. getCreatureName(cid) .. "? Veremos sua \ncapacidade para isso, apenas me responda uma pergunta e podera prosseguir, \nQual pais fica konoha?", {"Fechar", "Ajuda"})
    return true
end

local msg = string.lower(msg)
if isInArray({"ajuda"}, msg) then
-- npcHandler:say(_TR(cid,"Hahaha, tudo bem, vou te dar 3 alternativas, diga qual a correta:\na) {brasil}\nb) {pais do fogo}\nc) {africa}"), cid)
   sendNpcDialog(cid, getNpcCid(), "Hahaha, tudo bem, vou te dar 3 alternativas, diga qual a correta:\na) {brasil}\nb) {pais do fogo}\nc) {africa}", {"Fechar", "Pais do Fogo"})
talkState[talkUser] = 1
elseif isInArray({"a","pais do fogo"}, msg) and talkState[talkUser] == 1 then
npcHandler:say(_TR(cid,"Muito bem garoto!"), cid)
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif isInArray({"b","brasil"}, msg) then  
selfSay("Vai assistir naruto, mula.", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
elseif isInArray({"c","africa"}, msg) then  
selfSay(_TR(cid,"Africa nem é pais duença é um continente, vai estudar."), cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())