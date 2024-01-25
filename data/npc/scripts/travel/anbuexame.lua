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
local storage,pos = 19899,{x=904, y=970, z=7}
if isInArray({"exame","anbu","entrar","participar"}, msg) then
npcHandler:say("Muito bem shinobi, vou lhe mostrar o caminho para comecar o exame diga quando estiver {preparado}.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","preparado"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("Sua missao agora sera invadir o castelo anbu, boa sorte!", cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
else
npcHandler:say("Você já terminou a missão", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Eu sei, nao sao todos que tens coragem de fazer o exame!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())