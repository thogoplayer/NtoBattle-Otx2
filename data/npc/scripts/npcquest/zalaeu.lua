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
if(msgcontains(msg, 'ajudar')) then
selfSay('bring me 50 Mistic {Flame} essence that i will reward you', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'Flame')) then
selfSay('do you have 50 Mistic Flame essence to "get me"?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'conseguir', 'get me') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,115) > 0) then
selfSay('You have already finished this mission.', cid)
else
if(doPlayerRemoveItem(cid, 14382, 50) == true) then
setPlayerStorageValue(cid,115,1)
doPlayerAddExperience(cid,14000)
doPlayerAddEloPoints(cid,45)
selfSay('Thank you! As a reward take and read this book, it was my grandfather who gave it to me, he was a jounin, he could learn a lot from him ... {you read the book} ... (you received 14000 points of experience)', cid)
else
selfSay('You still haven/t got what I need, I/m waiting for you friend.', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())