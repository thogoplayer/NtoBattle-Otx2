local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local storage,pos = 132800,{x=1075, y=786, z=6}
if isInArray({"teleporto","teleport","teleporte","entrar"}, msg) then
npcHandler:say("Certo, ja lhe digo que tens que ter 1 amigo para fazer a quest juntamente com voce queres ir ao local onde fica o {inicio} da quest?.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","inicio"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Boa sorte na quest, voce em mais 1 tem que ficar em cima dos pisos vermelhos e um de voces puxar a alavanca!", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Voce ja completou essa Quest, nao pode mais ir ate o local", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Ok, volte quando quiser fazer a mesma e organize um time!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())