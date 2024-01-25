local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end



function onCreatureSay(cid, type, msg)
if (getDistanceToCreature(cid) > 2) then return true end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not getPlayerSaga(cid, 8,2) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. " estou montando um time para resgatar o sasuke!", {"Fechar", "Resgatar"})
    return true
end


local msg = string.lower(msg)
if isInArray({"resgate","resgatar"}, msg) then
-- npcHandler:say("Hm.. Entao quer ajudar a resgatar o sasuke {yes} ou {no}.", cid)
sendNpcDialog(cid, getNpcCid(), "Hm.. Então quer ajudar a resgatar o sasuke?", {"Fechar", "Ajudar"})
talkState[talkUser] = 1
elseif isInArray({"yes","pronto","ajudar"}, msg) and talkState[talkUser] == 1 then
-- npcHandler:say("Fiquei sabendo que a equipe do orochimaru foi vista recentemente em south florest.", cid)
sendNpcDialog(cid, getNpcCid(), "Fiquei sabendo que a equipe do orochimaru foi vista recentemente em south \nflorest.", {"Fechar"})
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