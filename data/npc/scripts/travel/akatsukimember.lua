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
local storage,pos = 19907,{x=783, y=1217, z=7}
if isInArray({"lute","fight","entrar","lutar"}, msg) then
npcHandler:say("UhaUAH, vou te mostrar o poder dos akatsukis, me diga quando estiver {pronto}.", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","pronto"}, msg) and talkState[talkUser] == 1 then
if getPlayerStorageValue(cid, storage) <= 0 then
npcHandler:say("A arena sera seu tumulo!", cid)
doTeleportThing(cid, pos)
else
npcHandler:say("Hhaha, estou brincando, nao quero lutar com voce denovo, fale 'fuinjutsu' na frente da rocha para entrar no covil", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Hmm.. esses sao os shinobis de hoje em dia? patetico!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())