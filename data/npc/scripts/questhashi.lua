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
if(msgcontains(msg, 'battles')) then
selfSay('His mistake was that he invoked me without total control of Edo Tensei, I will make his grave here, be "prepared".', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'prepared')) then
doCreateMonster("hashirama", {x = 1338, y = 2778, z = 12}) 
doRemoveCreature(getCreatureByName("senjuu hashirama"))
talkState[talkUser] = 1
elseif(msgcontains(msg, ' 3') and talkState[talkUser] == 1) then
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())