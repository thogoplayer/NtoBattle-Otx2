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

if getPlayerStorageValue(cid, 89743) == 2 then
selfSay("We don't recruit renegades.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)  
return true
end

local msg = string.lower(msg)
if isInArray({'exame', 'exam'}, msg) then
selfSay('To be part of the squadron {anbu} sera necessary to have completed at least 1 rank mission [B], the shizune can help you in this, come to min and prove bringing 3 medals rank[D], 3 medals rank[C] and 1 rank medal[B], I will be seeing in the rapporteurship of shizune if you really fulfilled this mission or bought from other people!', cid)
setPlayerStorageValue(cid, 89743, 1)
talkState[talkUser] = 1
elseif msgcontains(msg, 'anbu') and talkState[talkUser] == 1 then
    if getPlayerStorageValue(cid, 176601) > 10 then
	selfSay("All right, now we'll see if you're strong enough to be an anbu, if you can pass this {test} consider yourself a new squad member!", cid)
    talkState[talkUser] = 2
    else
	selfSay("Don't try to fool me, you still haven't fulfilled what I said.", cid)
	talkState[talkUser] = 0
	npcHandler:releaseFocus(cid)
	end
elseif isInArray({'teste', 'test'}, msg) and talkState[talkUser] == 2 then
	if getPlayerStorageValue(cid, 89744) < 0 then
	doTeleportThing(cid,{x = 2007, y = 1969, z = 6})
	elseif getPlayerStorageValue(cid, 89744) > 0 then
	setPlayerStorageValue(cid, 89745, 1)
	selfSay("You've been recruited into the Anbu squad.", cid)
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