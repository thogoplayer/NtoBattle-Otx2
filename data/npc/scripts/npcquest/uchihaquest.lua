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
if(msgcontains(msg, 'arriscar')) then
if (getPlayerStorageValue(cid,89234) < 0) then
selfSay('Esta bem , mas antes de me enfrentar traga-me 200 salamandras e 200 black {dusts}.', cid)
elseif (getPlayerStorageValue(cid,89234) > 0) then
doTeleportThing(cid, {x = 32, y = 1209, z = 7})
end
end
---------------------------------------------------------
if(msgcontains(msg, 'dusts')) then
if getPlayerItemCount(cid,5905) >= 200 then
if getPlayerItemCount(cid,5906) >= 200 then
doPlayerRemoveItem(cid, 5905, 200)
doPlayerRemoveItem(cid, 5906, 200)
setPlayerStorageValue(cid,89234,1)
doTeleportThing(cid, {x = 32, y = 1209, z = 7})
selfSay('Hahaha! Boa Sorte.', cid)
else
selfSay('Seus Salamandra dusts estao incompletos', cid)
end
else
selfSay('Seus Black dusts estao incompletos', cid)
end
talkState[talkUser] = 1
elseif(msgcontains(msg, 'salamandras') and talkState[talkUser] == 1) then
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())