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
selfSay("We don't take anbu spies.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
elseif getPlayerStorageValue(cid, 89746) == 1 then
selfSay("You are already an akatsuki member.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
elseif getPlayerLevel(cid) < 350 then
selfSay("Only Shinobi with levels 350 or higher are accepted at akatsuki.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
return true
end

local msg = string.lower(msg)
if isInArray({'akatsuki'}, msg) then
selfSay('now i will {test} your strength', cid)
setPlayerStorageValue(cid, 89743, 2)
talkState[talkUser] = 1
elseif isInArray({'test'}, msg) and talkState[talkUser] == 1 then
	if getPlayerStorageValue(cid, 89744) < 0 then
	doTeleportThing(cid,{x = 2427, y = 2999, z = 6})
	else
	setPlayerStorageValue(cid, 89746, 1)
	selfSay("Welcome to akatsuki.", cid)
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