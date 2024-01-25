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
    if not getPlayerSaga(cid, 12,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ". Vamos ver como esta indo seu treinamento, mostre-me tudo o que \naprendeu.", {"Fechar", "Treinamento"})
    return true
end

local msg = string.lower(msg)
if isInArray({"treinamento", "training"}, msg) then
-- npcHandler:say("Muito bem, derrote mil ninjas para provar que é capaz.", cid)
sendNpcDialog(cid, getNpcCid(), "Muito bem, derrote mil ninjas para provar que é capaz", {"Fechar"})
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 1193, y=2645, z= 4})
registerCreatureEvent(cid, "SagaTwelveNinjas")
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())