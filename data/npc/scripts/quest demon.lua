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
if(msgcontains(msg, "ajudar")) then
if getTilePzInfo(getCreaturePosition(cid)) == false then
npcHandler:say("Voce nao pode entrar na {quest} do lado de fora do PZ!", cid)
return true
end
npcHandler:say("Esta mesmo disposto a arriscar sua vida? {yes} or {no}", cid)
talkState[talkUser] = 1

elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
npcHandler:say("Esta bem, quando decidir fale comigo novamente.", cid)
talkState[talkUser] = 0

elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
npcHandler:say("que seja entao, por garantia voce ira ter de batalhar com diversos de meus subordinados para provar que tem a força que diz ter, boa sorte!!", cid)
npcHandler:releaseFocus(cid)
doTeleportThing(cid, {x = 1826, y = 2880, z = 6})
end
---------------------------------------------------------


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())