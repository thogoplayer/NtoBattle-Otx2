local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local area = {
{{x = 1830, y = 3565, z = 7},{x = 1998, y = 3843, z = 7}},
{{x = 1830, y = 3565, z = 6},{x = 1998, y = 3843, z = 6}}
}
local checkTime = 20 -- tempo em minutos
local storage_Saga4 = 50001

local function checkSaga4(cid)
if isCreature(cid) and getCreatureIn(cid, area) then
doPlayerRemoveItem(cid, 2198, getPlayerItemCount(cid, 2198))
doPlayerRemoveItem(cid, 2199, getPlayerItemCount(cid, 2199))
setPlayerSaga(cid, 4, 2)
setPlayerStorageValue(cid,39842, 0)
setPlayerStorageValue(cid,39843, 0)
doPlayerSendTextMessage(cid,22, "Your time is over")
doTeleportThing(cid,{x= 1965, y=2026, z= 7})
end
end

local function createOrochi(cid)
if isCreature(cid) then
doPlayerNextSaga(cid)
local sumonado = doCreateMonster("Orochimaru ", getCreaturePosition(cid))
onSay(sumonado, "Hello Sasuke", TALKTYPE_SAY)
addEvent(onSay, 1000, sumonado, "Shh...",TALKTYPE_SAY)
doSetCreatureOutfit(cid, {lookType = 390}, -1)
end
end



function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not getPlayerSaga(cid, 4,2) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 

    sendNpcDialog(cid, getNpcCid(), "Olá " .. getCreatureName(cid) .. ". Vejo que veio tentar a sorte no exame chunin!!", {"Fechar", "Exame"})
    return true
end


local msg = string.lower(msg)
if isInArray({"exame","fight","entrar","participar"}, msg) then
-- npcHandler:say("hAHAHAHA, um mero genin novato realmente quer {tentar} a sorte? porque as regras são as seguintes, você precisa coletar 2 pergaminhos e ir para a torre do exame chunin", cid)
sendNpcDialog(cid, getNpcCid(), "HAHAHAHA, um mero genin novato realmente quer tentar a sorte? porque as regras \nsão as seguintes, você precisa coletar 2 pergaminhos e ir para a torre do \nexame chunin", {"Fechar", "Tentar"})
talkState[talkUser] = 1
elseif isInArray({"yes","sim","tentar", "try"}, msg) and talkState[talkUser] == 1 then
if getGlobalStorageValue(storage_Saga4) - os.time() <= 0 then
doPlayerNextSaga(cid)
setPlayerStorageValue(cid,40235, 0)
-- npcHandler:say(string.format(_TR(cid,"Você Tem %d minutos para completar a saga"), checkTime), cid)
sendNpcDialog(cid, getNpcCid(), string.format(_TR(cid,"Você Tem %d minutos para completar a saga"), checkTime), {"Fechar"})
setGlobalStorageValue(storage_Saga4, checkTime*60 + os.time())
addEvent(checkSaga4, checkTime*TIME_MINUTES, cid)
addEvent(createOrochi, 5000, cid)
setPlayerStorageValue(cid, 39842, 0)
setPlayerStorageValue(cid, 39843, 0)
doTeleportThing(cid, {x = 1899, y = 3812, z = 7})
removeSummons(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
else
local seetime = getGlobalStorageValue(storage_Saga4)-os.time()
local minutes, seconds =  math.floor(seetime/60), math.floor(seetime%60)
-- npcHandler:say(string.format(_TR(cid,"Someone did this saga recently, please wait %s minutes and %s seconds"), minutes, seconds), cid)
sendNpcDialog(cid, getNpcCid(), string.format(_TR(cid,"Alguém fez esta saga recentemente, por favor aguarde %s minutos and %s segundos"), minutes, seconds), {"Fechar"})
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
end
elseif msg == "no" then  
selfSay("Hahahaha, achei que você não estava pronto!", cid)  
sendNpcDialog(cid, getNpcCid(), "Hahahaha, achei que você não estava pronto!", {"Fechar"})
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())