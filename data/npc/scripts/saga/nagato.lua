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
    if not getPlayerSaga(cid, 15,8) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ". Nós somos apenas homens, atraidos para agir em nome da vinganca que \njulgamos ser a justica, gerando mais vinganca...  Forjando o primeiro elo da \ncadeia de ódio.  Aceitar a morte de alguem é dificil. Nós nos convencemos de \nque essa pessoa não podia morrer. Você pode tentar encontrar um significado \nda morte,  mas so ha dor. Um ódio insuportável.  Mortes sem sentido... \nÓdio eterno e dor que nao passa, ainda acredito que um dia haja paz neste mundo, \nestarei lhe obserbando " .. getCreatureName(cid) .. " quando este dia chegar!", {"Fechar", "Paz"})
    return true
end

local msg = string.lower(msg)
local pos = {x = 2051, y = 1970, z = 4}
if isInArray({"paz","yes","sim"}, msg) then
doTeleportThing(cid, pos)
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