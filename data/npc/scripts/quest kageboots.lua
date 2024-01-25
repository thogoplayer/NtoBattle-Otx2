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



---------------------------------------------------------
if(msgcontains(msg, "ajudar")) then
if getTilePzInfo(getCreaturePosition(cid)) == false then
npcHandler:say("You cannot enter the {quest} outside PZ!", cid)
return true
end
npcHandler:say("After many years of exploration I found something still unknown, inside a large ice mountain there is a trail of crystais some ninjas went to investigate and found a chest but could not catch it because there was something strange protecting this time I intend to go with 6 level ninjas jounin or higher [...] shall we? {Yes} or {no}.", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no", "nao") and talkState[talkUser] == 1 then
npcHandler:say("Okay, I'll be waiting if you change your mind.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes", "sim") and talkState[talkUser] == 1 then
npcHandler:say("Vamos Lá!", cid)
npcHandler:releaseFocus(cid)
doTeleportThing(cid, {x = 1478, y = 3415, z = 7})
end
---------------------------------------------------------


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())