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
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local exp,t = 15000,{2244,1}
local s1,s2 = 15214,89745

if (not(getPlayerStorageValue(cid, 40000) == 0)) then
doPlayerPopupFYI(cid, "Voce nao pertence a esta Saga")
return false
end


local msg = string.lower(msg)
if isInArray({"certo"}, msg) then
npcHandler:say("Pois bem boa sorte shinobi!!.", cid)
setPlayerStorageValue(cid,40000, 1)
doPlayerPopupFYI(cid, "["..getPlayerStorageValue(cid, 40000).."/62] Converse com o Mizuki")
elseif msg == "no" then  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())