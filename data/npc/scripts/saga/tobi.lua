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
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ". Eu tenho uma missão para você.", {"Fechar", "Missao"})
    return true
end

local msg = string.lower(msg)
if isInArray({"missao", "mission"}, msg) then
-- npcHandler:say("prove para mim que vocÃª tem forÃ§a suficiente para fazer parte dessa facÃ§Ã£o, derrote o jinchuuriki de KumoGakure No Sato e traga para nÃ³s..cuidado, esse ninja Ã© um jinchuuriki completo.", cid)
sendNpcDialog(cid, getNpcCid(), "prove para mim que você tem força suficiente para fazer parte dessa facção, \nderrote o jinchuuriki de KumoGakure No Sato e traga para nós..cuidado, esse \nninja é um jinchuuriki completo.", {"Fechar"})
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())