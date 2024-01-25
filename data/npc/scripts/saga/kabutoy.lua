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
    if not getPlayerSaga(cid, 10,4) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Ola Sasori, enfim nos encontramos , agora temos que resolver alguns assuntos \npendentes.", {"Fechar", "Resolver"})
    return true
end

local area = {{x = 1074, y = 2698, z = 13},{x = 1145, y = 2724, z = 13} }

local msg = string.lower(msg)
if isInArray({"resolver"}, msg) then
npcHandler:say("Pois bem ja pode me entregar oque foi {combinado}.", cid)
sendNpcDialog(cid, getNpcCid(), "Pois bem ja pode me entregar oque foi combinado", {"Fechar", "Combinado"})
talkState[talkUser] = 1
elseif isInArray({"combinado"}, msg) and talkState[talkUser] == 1 then
    if getPlayerSaga(cid, 10, 4) then
    doRemoveCondition(cid, CONDITION_OUTFIT)
    doPlayerNextSaga(cid)
    end
    if not checkMonstersInArea(area,{"Orochimaru     "}) then
	-- npcHandler:say("HAHAHA!! Achou que podia me enganar", cid)
	sendNpcDialog(cid, getNpcCid(), "HAHAHA!! Achou que podia me enganar", {"Fechar"})
    local sumonado = doCreateMonster("orochimarusaga10", getCreaturePosition(cid))
    doCreatureSay(sumonado, "Hahaha! Idiota. Achou mesmo que poderia me enganar!", TALKTYPE_SAY)
    end
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