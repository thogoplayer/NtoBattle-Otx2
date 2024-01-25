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
return true
end

local msg = string.lower(msg)
if isInArray({'akatsuki', 'akat'}, msg) then
selfSay('To become a member of akatsuki must prove that you have cold blood, bring me 30 {hearts} as proof that you have enough strength to pass the test.', cid)
setPlayerStorageValue(cid, 89743, 2)
talkState[talkUser] = 1
elseif isInArray({'hearts', 'heart'}, msg) and talkState[talkUser] == 1 then
    if getPlayerStorageValue(cid, 89744) > 0 or doPlayerRemoveItem(cid,5943,30) then
	selfSay("All right, now we'll see if you're strong enough to be an anbu, if you can pass this {test} consider yourself a new squad member!", cid)
	if getPlayerStorageValue(cid, 89744) < 1 then
	setPlayerStorageValue(cid, 89744, 1)
	end
    talkState[talkUser] = 2
    else
	selfSay("Don't try to fool me, you still haven't fulfilled what I said.", cid)
	talkState[talkUser] = 0
	npcHandler:releaseFocus(cid)
	end
elseif isInArray({'teste', 'test'}, msg) and talkState[talkUser] == 2 then
	if getPlayerStorageValue(cid, 89744) == 1 then
	doTeleportThing(cid,{x = 2427, y = 2999, z = 6})
	selfSay("All right, you're going to pass a test now, I'll be waiting for you at the end!", cid)
	elseif getPlayerStorageValue(cid, 89744) == 2 then
	setPlayerStorageValue(cid, 89746, 1)
	selfSay("You've become a member of akatsuki.", cid)
	else
	selfSay("Don't try to fool me, you still haven't fulfilled what I said.", cid)
	end
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end

return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())