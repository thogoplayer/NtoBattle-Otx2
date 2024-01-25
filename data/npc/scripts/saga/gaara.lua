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

if (not(getPlayerStorageValue(cid, 40000) == 39)) then
npcHandler:say("Você não pertence a esta Saga.", cid)
return false
end


local msg = string.lower(msg)
if isInArray({"yes"}, msg) then
npcHandler:say("Muito obrigado "..getCreatureName(cid).." graças a voce irei poder voltar para a minha vila!!.", cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "no" then  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())