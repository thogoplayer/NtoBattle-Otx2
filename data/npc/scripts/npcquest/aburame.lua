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
local msg = string.lower(msg)
if isInArray({'interested', 'interessado'}, msg) then
selfSay('I need you to bring me 100 demonic dust and 100 canine fangs, when the "finish" let me know!', cid)
end
---------------------------------------------------------
if isInArray({'finish', 'finalizar', 'terminar'}, msg) then
selfSay('already got everything? "yes"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,181000) > 0) then
selfSay('you already finished this mission.', cid)
else
if getPlayerItemCount(cid, 12381) >= 100 and getPlayerItemCount(cid, 5467) >= 100 then
doPlayerRemoveItem(cid, 12381, 100)
doPlayerRemoveItem(cid, 5467, 100)
setPlayerStorageValue(cid,181000,1)
doPlayerAddExperience(cid,29000)
doPlayerAddItem(cid,15489,1)
selfSay('thank you, here your reward(you received 29000 points of experience extra)', cid)
else
selfSay('You still don"t have what I need, I"m waiting...', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())