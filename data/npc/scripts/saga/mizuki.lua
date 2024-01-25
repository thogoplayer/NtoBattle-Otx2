local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatMizuki(cid)
if isCreature(cid) then
registerCreatureEvent(cid, "sagaonemfourk")
local sumonado = doCreateMonster("mizukii", {x= 1972, y=1966, z= 7})
doCreatureSay(sumonado, "Nessa floresta sera seu Funeral!!", TALKTYPE_SAY)
removeSummons(cid)
-- doRemoveCreature(getCreatureByName("Mizuki "))
end
end

function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not getPlayerSaga(cid, 1,4) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Veio mesmo com o pergaminho até aqui " .. getCreatureName(cid) .. ". Não sabia que voce era tão burro \na ponto de acreditar em mim, mas e agora esta pronto para lutar?", {"Fechar", "Lutar"})
    return true
end

if isInArray({"lutar","fight","entrar","participar"}, msg) then
-- npcHandler:say("HAHAHAHA, um mero academico quer mesmo lutar contra um Chunin, sabes que nao tem chance, esta mesmo preparado? {yes}", cid)
sendNpcDialog(cid, getNpcCid(), "HAHAHAHA, um mero academico quer mesmo lutar contra um Chunin, \nsabes que nao tem chance, esta mesmo preparado?", {"Fechar", "Sim"})
talkState[talkUser] = 1
elseif isInArray({"yes","sim"}, msg) and talkState[talkUser] == 1 then
addEvent(creatMizuki, 2, cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "no" then  
selfSay("Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())