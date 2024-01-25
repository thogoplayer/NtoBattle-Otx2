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
if(msgcontains(msg, 'quest')) then
selfSay('Ok, you can started "first mission"?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'first mission')) then
selfSay('Please bring me 10 "meat"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'meat') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('You finished this mission.', cid)
else
if(doPlayerRemoveItem(cid, 2666, 10) == true) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExperience(cid,1000)
selfSay('Thank you! You can started "second mission".. (you received 1000 points of experience)', cid)
else
selfSay('You must have more items', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'second mission')) then
selfSay('Please bring me 10 "ham"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'ham') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('You finished this mission.', cid)
else
if(doPlayerRemoveItem(cid, 2671, 10) == true) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,1000)
selfSay('Thank you! You can started "third mission".. (you received 1000 points of experience)', cid)
else
selfSay('You must have more items', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'third mission')) then
selfSay('Please bring me 20 "ham"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'ham') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('You finished this mission.', cid)
else
if(doPlayerRemoveItem(cid, 2671, 20) == true) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExperience(cid,1000)
selfSay('Thank you! You finished all missions. (you received 1000 points of experience)', cid)
else
selfSay('You must have more items', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())