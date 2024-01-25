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
selfSay('I need you to bring me 100 renegade and 100 magic essence, when the "finish" let me know!', cid)
end
---------------------------------------------------------
if isInArray({'finish', 'finalizar', 'terminar'}, msg) then
selfSay('already got everything? "yes"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,181004) > 0) then
selfSay('you already finished this mission.', cid)
else
if getPlayerItemCount(cid, 6500) >= 100 and getPlayerItemCount(cid, 11155) >= 100 then
doPlayerRemoveItem(cid, 6500, 100)
doPlayerRemoveItem(cid, 11155, 100)
setPlayerStorageValue(cid,181001,1)
doPlayerAddExperience(cid,21000)
doPlayerAddItem(cid,15490,1)
selfSay('thank you, here your reward(you received 21000 points of experience extra)', cid)
else
selfSay('You still don"t have what I need, I"m waiting...', cid)
end
end
return true
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())