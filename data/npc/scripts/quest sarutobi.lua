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
if(msgcontains(msg, "treinamento")) then
if getTilePzInfo(getCreaturePosition(cid)) == false then
npcHandler:say("You cannot enter outside the PZ!", cid)
return true
end
npcHandler:say("Are you ready to start? remembering that a full team is needed. {yes} or {no}", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no", "nao") and talkState[talkUser] == 1 then
npcHandler:say("Okay, get your team together and come later.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes", "sim") and talkState[talkUser] == 1 then
npcHandler:say("Come on!", cid)
npcHandler:releaseFocus(cid)
doTeleportThing(cid, {x = 1921, y = 2839, z = 7})
end
---------------------------------------------------------


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())