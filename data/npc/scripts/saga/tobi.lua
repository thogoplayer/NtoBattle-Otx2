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
    if not getPlayerSaga(cid, 14,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] N�o posso falar com voc� neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Ol� " .. getCreatureName(cid) .. ". Eu tenho uma miss�o para voc�.", {"Fechar", "Missao"})
    return true
end

local msg = string.lower(msg)
if isInArray({"missao", "mission"}, msg) then
-- npcHandler:say("prove para mim que você tem força suficiente para fazer parte dessa facção, derrote o jinchuuriki de KumoGakure No Sato e traga para nós..cuidado, esse ninja é um jinchuuriki completo.", cid)
sendNpcDialog(cid, getNpcCid(), "prove para mim que voc� tem for�a suficiente para fazer parte dessa fac��o, \nderrote o jinchuuriki de KumoGakure No Sato e traga para n�s..cuidado, esse \nninja � um jinchuuriki completo.", {"Fechar"})
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())