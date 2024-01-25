local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local temp_Saga11 = 20 -- tempo em minutos
local g_stor_saga11 = 50002


local function saga11V(cid)
if isCreature(cid) and isInRange(getCreaturePosition(cid), {x = 2390, y = 3685, z = 7},{x = 2472, y = 3792, z = 7}) then
setPlayerSaga(cid, 11, 1) 
doTeleportThing(cid,{x= 2012, y=2026, z= 7})
removeMonsters({"kakuzu  ","kakuzu ","hidan "})
doPlayerSendTextMessage(cid,22,"Seu tempo acabou")
end
end





function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not (getPlayerSaga(cid, 10, 2) or getPlayerSaga(cid, 11, 1)) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 
	
	local sagaTable = {
	["yamato"] = {
	[10] = { -- 2.1
		[1] = "Olá " .. getCreatureName(cid) .. " descobrimos que havia um espião da Akatsuki, subordinado a Orochimaru. \nTemos que descobrir quem é.",
		[2] = "Descobrir",
	},
	
	-- 5.1
	[11] = {
		[1] = "Olá " .. getCreatureName(cid) .. " chegou na hora, dois membros da akatsuki foram vistos recentemente!",
		[2] = "Akatsuki",
	},
}
}

    	if getPlayerSaga(cid, 10, 2) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["yamato"][10][1], {"Fechar", sagaTable["yamato"][10][2]})
		elseif getPlayerSaga(cid, 11, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["yamato"][11][1], {"Fechar", sagaTable["yamato"][11][2]})
	end
    return true
end


if isInArray({"descobrir", "find out"}, msg) and getPlayerSaga(cid, 10, 2) then
-- npcHandler:say("Segundo o sasori, eles iriam se encontrar na {ponte} Tenchi!!.", cid)
sendNpcDialog(cid, getNpcCid(), "Segundo o sasori, eles iriam se encontrar na ponte Tenchi!!.", {"Fechar", "Ponte"}) 
talkState[talkUser] = 1
elseif isInArray({"ponte"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
elseif isInArray({"akatsuki"}, msg) and getPlayerSaga(cid, 11) then
-- npcHandler:say("{Detenham}-os antes que algo de pior aconteça, nao sabemos oque estao tramando!!.", cid)
sendNpcDialog(cid, getNpcCid(), "Detenham-os antes que algo de pior aconteça, nao sabemos oque estao tramando!!.", {"Fechar", "Deter"}) 
talkState[talkUser] = 2
elseif isInArray({"Detenha","Detenham","detenham-os","detenham","detenha","deter","yes","detenha"}, msg) and talkState[talkUser] == 2 then
if getGlobalStorageValue(g_stor_saga11) - os.time() <= 0 then
-- npcHandler:say("Voce tem "..temp_Saga11.." minutos para completar a saga", cid)
sendNpcDialog(cid, getNpcCid(), "Voce tem "..temp_Saga11.." minutos para completar a saga", {"Fechar"}) 
setGlobalStorageValue(g_stor_saga11, temp_Saga11*60 + os.time())
addEvent(saga11V, temp_Saga11*TIME_MINUTES, cid)
doTeleportThing(cid, {x = 2427, y = 3775, z = 7})
doPlayerNextSaga(cid)
doCreateMonster("hidan ", {x= 2439, y=3768, z= 7})
doCreateMonster("kakuzu ", {x= 2438, y=3712, z= 7})
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
else
local seetime = getGlobalStorageValue(g_stor_saga11)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
-- npcHandler:say(string.format(_TR(cid,"Alguem fez esta saga recentemente, favor aguarde %s minutos e %s segundos"), minutes, seconds), cid)
sendNpcDialog(cid, getNpcCid(), string.format(_TR(cid,"Alguem fez esta saga recentemente, favor aguarde %s minutos e %s segundos"), minutes, seconds), {"Fechar"}) 
end  
elseif msg == "no" then  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())