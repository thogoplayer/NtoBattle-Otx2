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
    if not getPlayerSaga(cid, 6,2) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. " parace que o Jiraya o-mandou aqui ver como estou, estou certa?", {"Fechar", "Certa"})
    return true
end

local msg = string.lower(msg)
if isInArray({"certa","yes"}, msg) then
-- npcHandler:say("Pois bem, o problema e que o orochimaru e o kabuto estao tramando algo e precisam que eu desfaça o jutsu usado pelo Sandaime Hokage que selou os braços do orochimaru. Voce pode me ajudar {derrota}-los?", cid)
sendNpcDialog(cid, getNpcCid(), "Pois bem, o problema e que o orochimaru e o kabuto estao tramando algo e \nprecisam que eu desfaça o jutsu usado pelo Sandaime Hokage que selou os braços \ndo orochimaru. Voce pode me ajudar derrota-los?", {"Fechar", "Sim"})
talkState[talkUser] = 1
elseif isInArray({"derrota","derrotar","sim","yes"}, msg) and talkState[talkUser] == 1 then
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