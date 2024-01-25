local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	 npcHandler:onCreatureAppear(cid)	 end
function onCreatureDisappear(cid)	 npcHandler:onCreatureDisappear(cid)	 end
function onCreatureSay(cid, type, msg)	 npcHandler:onCreatureSay(cid, type, msg)	 end
function onThink()	 npcHandler:onThink()	 end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

preco = {
[-1] =  100000,
[0] = 200000,
[1] = 300000,
[2] = 400000,
[3] = 500000,
[4] = 600000,
[5] = 700000,
[6] = 800000,
[7] = 900000,
[8] = 1000000
}

if(msgcontains(msg, 'promover')) then
selfSay('Say the name of the player you want as a reward for your head.', cid)
talkState[talkUser] = 1
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 1 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) < 9 then
if doPlayerRemoveMoney(cid, preco[getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)]) == true then
setPlayerStorageValue(getPlayerByNameWildcard(msg), 13131, getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) + 1)
doBroadcastMessage("O jogador "..msg.." foi promovido para o nivel "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", BroadCast_Type)
else
selfSay('Sorry, you dont have the money to pay the killer.', cid)
end
else
selfSay('The player you have chosen is already at the maximum wanted alert level..', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == true) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'level')) then
selfSay('Say the name of the player you want to check the wanted level.', cid)
talkState[talkUser] = 2
elseif isPlayer(getPlayerByNameWildcard(msg)) and talkState[talkUser] == 2 then
if getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131) >= 0 then
selfSay("O level de recompensa deste jogador é "..getPlayerStorageValue(getPlayerByNameWildcard(msg), 13131)..".", cid)  --sefodeu
else
selfSay('This player is not wanted.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == true) then
talkState[talkUser] = 0
selfSay('Certo entao.', cid)
end

if(msgcontains(msg, 'recompensa')) then
selfSay('Do you want to check your reward level?', cid)
talkState[talkUser] = 3
elseif (msgcontains(msg, 'yes') and talkState[talkUser]) == 3 then
if getPlayerStorageValue(cid, 13131) >= 0 then
selfSay("O seu level de recompensa é "..getPlayerStorageValue(cid, 13131)..".", cid)
else
selfSay('You are not being sought.', cid)
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == true) then
talkState[talkUser] = 0
selfSay('Right then.', cid)
end

if(msgcontains(msg, 'informaçoes')) then
selfSay('Very simple, you pay an initial amount of 25 Jp Yen to put a player/s head in reward, when someone kills this player he will receive the money, remembering that to increase the wanted level it is necessary to always pay an amount above the previous one.', cid)
talkState[talkUser] = 0
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())