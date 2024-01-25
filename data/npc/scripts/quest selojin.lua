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
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'batalha')) then
selfSay('Do you want to {face me} to obtain such power?.', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'enfrentar')) then
doCreateMonster("ootsuki hagoromo", {x = 821, y = 1877, z = 11}) 
selfSay('good luck boy.', cid)
doRemoveCreature(getCreatureByName("rikkudou"))
talkState[talkUser] = 1
elseif(msgcontains(msg, ' 3') and talkState[talkUser] == 1) then
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())