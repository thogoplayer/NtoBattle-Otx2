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
    if not getPlayerSaga(cid, 6,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ". você pode me ajudar?!", {"Fechar", "Ajudar"})
    return true
end


local msg = string.lower(msg)
if isInArray({"ajuda","ajudar"}, msg) then
-- npcHandler:say("Ultimamente eu ando preocupado com a tsunade pelo fato de orochimaru ter aparecido recetemente, voce pode ir {conversar} com ela?.", cid)
sendNpcDialog(cid, getNpcCid(), "Ultimamente eu ando preocupado com a tsunade pelo fato de orochimaru ter \naparecido recetemente, voce pode ir conversar com ela?.", {"Fechar", "Conversar", "Nao"})
talkState[talkUser] = 1
elseif isInArray({"yes","pronto","conversar"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "nao" then  
-- selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)
sendNpcDialog(cid, getNpcCid(), "Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", {"Fechar"})  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())