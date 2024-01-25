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
npcHandler:say("Okay, I don't have much to say We need to defeat the Kyuubi, {yes} or {no}", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no", "nao") and talkState[talkUser] == 1 then
npcHandler:say("Okay, I'll be waiting if you change your mind.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes", "sim") and talkState[talkUser] == 1 then
npcHandler:say("go!", cid)
npcHandler:releaseFocus(cid)
doTeleportThing(cid, {x = 2446, y = 3509, z = 7})
end
---------------------------------------------------------


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())