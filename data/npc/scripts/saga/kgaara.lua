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

if (not(getPlayerStorageValue(cid, 40000) == 16000)) then
return false
end

if (not(getPlayerStorageValue(cid, 40104) == 2)) then
npcHandler:say("Você não pertence a esta missão.", cid)
return false
end


local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
local pos = {x= 3387, y=3461, z= 7}
if isInArray({"exame","fight","entrar","participar"}, msg) then
npcHandler:say("HAHAHAHA, um mero genin novato quer mesmo {tentar} a sorte? pois bem as regras são as seguintes, voce precisa coletar 2 pergaminhos e ir para a torre do exame chunin", cid)
talkState[talkUser] = 1
elseif isInArray({"yes","sim","tentar"}, msg) and talkState[talkUser] == 1 then
setPlayerStorageValue(cid,40104, 3)
doPlayerAtualSaga(cid)
local function Orochi(cid)
local outfia = {lookType = 627, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0}
local outfit = getCreatureOutfit(cid)
for i, v in pairs(outfia) do
		outfit[i] = v
	end
doSetCreatureOutfit(cid, outfit, -1)
setPlayerStorageValue(cid,40104, 4)
doPlayerAtualSaga(cid)
local sumonado = doCreateMonster("Orochimaru ", getCreaturePosition(cid))
doCreatureSay(sumonado, "Ola Sasuke", TALKTYPE_SAY)
addEvent(doCreatureSay, 1000, sumonado, "Shh...",TALKTYPE_SAY)
end
setPlayerStorageValue(cid,40235, 0)
addEvent(Orochi, 5000, cid)
talkState[talkUser] = 0  
doTeleportThing(cid, pos)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "no" then  
selfSay("Hahahaha, imaginei que você não estava preparado!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())