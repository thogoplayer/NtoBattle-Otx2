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
local config = {
hours = 24,
storage = 58485,
rewards = {{itemid = 11989,chance = 20},{itemid = 11452,chance = 20},{itemid = 11846,chance = 5},{itemid = 7898,chance = 20},{itemid = 2436,chance = 20},{itemid = 12815,chance = 20},{itemid = 12814,chance = 20},{itemid = 12129,chance = 20},{itemid = 11477,chance = 20},{itemid = 2160,chance = 20}} -- itens que ele poderá ganhar 
}
function doAddReward()
a = true
while a == true do
local m = math.random(1,#config.rewards)
if config.rewards[m].chance > math.random(1, 100) then
doPlayerAddItem(cid, config.rewards[m].itemid, isItemStackable(config.rewards[m].itemid) and 100 or 1)
npcHandler:say("seu premio foi: "..getItemNameById(config.rewards[m].itemid), cid)
a = false
end
end
end
if isInArray({"receber"}, msg) then
npcHandler:say("voce deseja receber seu item agora?! {yes}", cid)
talkState[talkUser] = 1
elseif (msgcontains(msg, 'yes','sim','claro') and talkState[talkUser] == 1) then
if getPlayerStorageValue(cid,config.storage) <= os.time() then
doAddReward()
setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)
else
npcHandler:say("Desculpe, mas voce deve aguardar ate "..os.date("%d %B %Y %X ", getPlayerStorageValue(cid,config.storage)).." para pegar outro item novamente!", cid)
talkState[talkUser] = 0
end
elseif msg == "no" then  
selfSay("Então não", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())