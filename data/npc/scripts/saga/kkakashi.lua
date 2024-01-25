local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local temp_Saga2 = 10 -- tempo em minutos
local g_stor_Saga2 = 5000
local function saga2V(cid)
if isCreature(cid) and isInRange(getCreaturePosition(cid), {x= 2273, y=3666, z= 7}, {x= 2351, y=3742, z= 7}) then
doTeleportThing(cid,{x= 2050, y=2095, z= 7})
setPlayerSaga(cid, 2, 1)
doPlayerSendTextMessage(cid,22,"Seu tempo acabou")
end
end




function onCreatureSay(cid, type, msg)
if (getDistanceToCreature(cid) > 1) then return true end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not (getPlayerSaga(cid, 2, 1) or getPlayerSaga(cid, 5, 1) or getPlayerSaga(cid, 8, 1)) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 
	
	local sagaTable = {
	["kakashi"] = {
	[2] = { -- 2.1
		[1] = "Olá " .. getCreatureName(cid) .. " Vejo que você se tornou um genin recentemente para começar a fazer \nmissões, você precisa fazer um treinamento primeiro.",
		[2] = "Treinar",
	},	
	[5] = {
		[1] = "Olá " .. getCreatureName(cid) .. " Você notou? O chakra do Gaara durante o exame chunin estava fora do \ncomum, isso pode trazer sérios problemas para a vila, precisamos parar isso!",
		[2] = "Deter",
	},
	[8] = {
		[1] = "Essa não!! Sasuke foi sequestrado e está sendo levado para o covil orochimaru! \nPrecisamos parar eles antes que eles cheguem lá",
		[2] = "Parar",
	},
}
}

    	if getPlayerSaga(cid, 2, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["kakashi"][2][1], {"Fechar", sagaTable["kakashi"][2][2]})
		elseif getPlayerSaga(cid, 5, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["kakashi"][5][1], {"Fechar", sagaTable["kakashi"][5][2]})
		elseif getPlayerSaga(cid, 8, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["kakashi"][8][1], {"Fechar", sagaTable["kakashi"][8][2]})
	end
    return true
end


if isInArray({"treino","treinar", "training", "train"}, msg) and getPlayerSaga(cid, 2, 1) then
-- npcHandler:say("Para concluir o treino basta me derrotar e pegar meus gizos, voce esta {pronto}?.", cid)
sendNpcDialog(cid, getNpcCid(), "Para concluir o treino basta me derrotar e pegar meus gizos, voce esta pronto?.", {"Fechar", "Pronto"})
talkState[talkUser] = 2
elseif isInArray({"yes","pronto"}, msg) and getPlayerSaga(cid, 2, 1) and talkState[talkUser] == 2 then
if getGlobalStorageValue(g_stor_Saga2) - os.time() <= 0 then
-- npcHandler:say("Boa Sorte!", cid)
sendNpcDialog(cid, getNpcCid(), "Boa Sorte!", {"Fechar"})
-- npcHandler:say("Você tem "..temp_Saga2.." minutos para completar a saga", cid)
sendNpcDialog(cid, getNpcCid(), "Você tem "..temp_Saga2.." minutos para completar a saga", {"Fechar"})
setGlobalStorageValue(g_stor_Saga2, temp_Saga2*60 + os.time())
addEvent(saga2V, temp_Saga2*TIME_MINUTES, cid)
doSetCreatureOutfit(cid, {lookType = 350}, -1)
doPlayerNextSaga(cid)
doTeleportThing(cid, {x= 2300, y=3698, z= 7})
removeSummons(cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
else
local seetime = getGlobalStorageValue(g_stor_Saga2)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
-- npcHandler:say(string.format(_TR(cid,"Alguem fez esta saga recentemente, favor aguarde %s minutos e %s segundos"), minutes, seconds), cid)
sendNpcDialog(cid, getNpcCid(), string.format(_TR(cid,"Alguem fez esta saga recentemente, favor aguarde %s minutos e %s segundos"), minutes, seconds), {"Fechar"})
end
elseif isInArray({"deter","deter-lo", "stop"}, msg) and getPlayerSaga(cid, 5, 1) then
-- npcHandler:say("Tem {certeza} que pode fazer isso? Nao tenho certeza do que o gaara pode fazer nesse estado?.", cid)
sendNpcDialog(cid, getNpcCid(), "Tem certeza que pode fazer isso? Nao tenho certeza do que o gaara pode fazer \nnesse estado?.", {"Fechar", "Sim"})
talkState[talkUser] = 6
elseif isInArray({"yes","certeza", "sim"}, msg) and getPlayerSaga(cid, 5, 1) and talkState[talkUser] == 6 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
elseif isInArray({"para","parar","stop", "stop"}, msg) and (getPlayerStorageValue(cid, 40000) == 8) then
-- npcHandler:say("Nesse momento precisamos do maximo de ajuda possivel, se voce quer {ajudar} nesta missao va até o shikamaru.", cid)
sendNpcDialog(cid, getNpcCid(), "Nesse momento precisamos do maximo de ajuda possivel, se voce quer ajudar \nnesta missao va até o shikamaru.", {"Fechar", "Ajudar"})
talkState[talkUser] = 11
elseif isInArray({"ajudar"}, msg) and getPlayerSaga(cid, 8, 1) and talkState[talkUser] == 11 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
elseif msg == "no" and getPlayerSaga(cid, 2, 1) then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
elseif msg == "no" and getPlayerSaga(cid, 5, 1) then  
selfSay("Hmm.. Muito bem genin volte para a academia shinobi e volte depois!", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
elseif msg == "no" and getPlayerSaga(cid, 8, 1) then  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())