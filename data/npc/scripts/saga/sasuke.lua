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
    if not getPlayerSaga(cid, 7,1) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] N�o posso falar com voc� neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Oque voce veio fazer aqui? haha eu ainda vingarei meu clan matando o itachi \nuchiha? Nao adianta me fazer parar!", {"Fechar", "Parar"})
    return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"parar"}, msg) then
-- npcHandler:say("HAHAHAHA, ninguem vai me impedir de matar meu irm�o e se voc� n�o sair do meu caminho tambem morrer�? quer mesmo tentar a sorte idiota?{yes}", cid)
sendNpcDialog(cid, getNpcCid(), "HAHAHAHA, ningu�m vai me impedir de matar meu irm�o e se voc� n�o sair do meu \ncaminho tambem morrer�!! quer mesmo tentar a sorte idiota?", {"Fechar", "Sim", "Nao"})
talkState[talkUser] = 1
elseif isInArray({"yes","sim"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
doRemoveCreature(getNpcId())
doCreateMonster("Sasuke  ", {x= 2120, y=2065, z= 5})
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "nao" then  
selfSay("Hahahaha, sabia que voc� era fraco, fuja seu verme, fuja pra bem longe", cid)  
sendNpcDialog(cid, getNpcCid(), "Hahahaha, sabia que voc� era fraco, fuja seu verme, fuja pra bem longe", {"Fechar"})
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())