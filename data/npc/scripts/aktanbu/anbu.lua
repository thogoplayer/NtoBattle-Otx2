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

if getPlayerStorageValue(cid, 89743) == 1 then
selfSay("We don't recruit renegades.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
elseif getPlayerStorageValue(cid, 89745) == 1 then
selfSay("You are already anbu.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
elseif getPlayerLevel(cid) < 350 then
selfSay("Voce precisa ter nivel 350 ou mais para entrar na Anbu.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
return true
end

local msg = string.lower(msg)
if isInArray({'exam'}, msg) then
selfSay('right, we will start the {test}', cid)
setPlayerStorageValue(cid, 89743, 2)
talkState[talkUser] = 1
elseif isInArray({'test'}, msg) and talkState[talkUser] == 1 then
	if getPlayerStorageValue(cid, 89744) < 0 then
	doTeleportThing(cid,{x = 2007, y = 1969, z = 6})
	else
	setPlayerStorageValue(cid, 89745, 1)
	selfSay("Welcome to Anbu.", cid)
	-- else
	-- selfSay("Don't try to fool me, you still haven't fulfilled what I said.", cid)
	end
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end

return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
