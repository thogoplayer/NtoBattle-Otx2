local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end



function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not (getPlayerSaga(cid, 15,4) or getPlayerSaga(cid, 15, 6)) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] Não posso falar com você neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 
	
	local sagaTable = {
	["fukasaku"] = {
	[9] = { -- 2.1
		[1] = "Olá " .. getCreatureName(cid) .. " como esta indo seu treino?!",
		[2] = "Treino",
	},
	
	-- 5.1
	[15] = {
		[1] = "Olá " .. getCreatureName(cid) .. " como esta indo seu treino?!",
		[2] = "Treino",
	},
}
}

    	if getPlayerSaga(cid, 15, 4) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["fukasaku"][9][1], {"Fechar", sagaTable["fukasaku"][9][2]})
		elseif getPlayerSaga(cid, 15, 6) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["fukasaku"][15][1], {"Fechar", sagaTable["fukasaku"][15][2]})
	end
    return true
end

local msg = string.lower(msg)
if isInArray({"treino"}, msg) and getPlayerSaga(cid, 15, 4) then
-- npcHandler:say("Muito bem!! Vejo que conseguiu concetrar o seu Chakra agora vença uma {batalha} com o gamabunta para concluir seu treino", cid)
sendNpcDialog(cid, getNpcCid(), "Muito bem!! Vejo que conseguiu concetrar o seu Chakra agora vença uma batalha \ncom o gamabunta para concluir seu treino", {"Fechar", "Batalha"})
talkState[talkUser] = 1
elseif isInArray({"treino"}, msg) and getPlayerSaga(cid, 15, 6) then
-- npcHandler:say("Estou surpreso com tal poder, vejo que concluiu seu treino e já pode voltar para konoha", cid)
sendNpcDialog(cid, getNpcCid(), "Estou surpreso com tal poder, vejo que concluiu seu treino e ja pode voltar \npara konoha", {"Fechar", "Voltar"})
talkState[talkUser] = 2
elseif isInArray({"batalha"}, msg) and talkState[talkUser] == 1 then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif isInArray({"voltar"}, msg) and talkState[talkUser] == 2 then
doTeleportThing(cid,{x = 2196, y = 3312, z = 7})
doPlayerNextSaga(cid)
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