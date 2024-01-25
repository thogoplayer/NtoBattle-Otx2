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


if msgcontains(msg, "sim") or msgcontains(msg, "simbolo") or msgcontains(msg, "yes") then
npcHandler:say("I'll give you this: \ n- {Silver} key for the item ok?.", cid)
end

--------------------------Hidan--------------------------------
if msgcontains(msg, "silver") or msgcontains(msg, "Silver") then
npcHandler:say("Did you really get the item and want to exchange it? {yes} or {no}.", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "nao","no") and talkState[talkUser] == 1 then
npcHandler:say("Wow ... I thought I was with him...", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "sim","yes") and talkState[talkUser] == 1 then
if doPlayerRemoveItem(cid, 17085, 1) == true then
npcHandler:say("as a thank you i will give you a clue where you can use the key!.", cid)
doPlayerAddItem(cid, 17200, 1)
doPlayerAddItem(cid, 1951, 1)
else
npcHandler:say("You don't have the item yet ...", cid)
end
end




end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())