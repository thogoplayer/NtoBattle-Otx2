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
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if isInArray({'termais','termal', 'hot spring', 'hot springs'}, msg) then
selfSay('The hot springs are a way to regenerate your stamina, they are very {relaxing}.', cid)
end
---------------------------------------------------------
if isInArray({'relaxantes', 'relaxing', 'relaxar', 'relaxa'}, msg) then
selfSay('To enter the sources, you will first have to {pay} 15 Jp Yen.', cid)
end
---------------------------------------------------------
if isInArray({'pagar', 'pay'}, msg) then
if getPlayerItemCount(cid,2160) >= 15 then
doPlayerRemoveItem(cid, 2160, 15)
setPlayerStorageValue(cid,747654,1)		
setPlayerStorageValue(cid,758498,1)
selfSay('You will be brand new!', cid)
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
else
selfSay('You do not have money!!', cid)
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
end
 
 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())