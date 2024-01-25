local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
talkState[talkUser] = 0
return true
end

local goldsIds = 2160 -- põe o id do diamond
local goldsQuant = 30 -- quantidade que ira remover de diamonds

function creatureSayCallback(cid, type, msg)

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

if(not npcHandler:isFocused(cid)) then  
return false  
end

if msgcontains(msg, 'bless') then
if getPlayerItemCount(cid, goldsIds) >= goldsQuant then
    doPlayerRemoveItem(cid, goldsIds, goldsQuant)
	for i=1, 5 do
		doPlayerAddBlessing(cid, i)
	end
	selfSay("Você recebeu sua bless!", cid)
else		
	selfSay("Você precisa de "..goldsQuant.." golds para comprar bless.", cid)
end
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())