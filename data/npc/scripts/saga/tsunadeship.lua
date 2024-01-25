local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end



function onCreatureSay(cid, type, msg)
if (getDistanceToCreature(cid) > 1) then return true end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if msgcontains(msg, "hi") then
    if not (getPlayerSaga(cid, 9,1) or getPlayerSaga(cid, 15, 1)) then
    sendNpcDialog(cid, getNpcCid(), "[SAGA SYSTEM] N�o posso falar com voc� neste momento", {"Fechar"})
    talkState[talkUser] = 0
    npcHandler:releaseFocus(cid)  
    return true
    end 
	
	local sagaTable = {
	["tsunade"] = {
	[9] = { -- 2.1
		[1] = "Ol� " .. getCreatureName(cid) .. " Que bom que voc� voltou, voc� cresceu muito, espero que esteja \npronto para mais uma miss�o.",
		[2] = "Missao",
	},
	
	-- 5.1
	[15] = {
		[1] = "Ol� " .. getCreatureName(cid) .. " Sinto muito pelo Jiraya, estamos todos abalados com o ocorrido, mas s� \nnos resta, seguir em frente.",
		[2] = "Seguir",
	},
}
}

    	if getPlayerSaga(cid, 9, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["tsunade"][9][1], {"Fechar", sagaTable["tsunade"][9][2]})
		elseif getPlayerSaga(cid, 15, 1) then
			sendNpcDialog(cid, getNpcCid(), sagaTable["tsunade"][15][1], {"Fechar", sagaTable["tsunade"][15][2]})
	end
    return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({"missao","mission"}, msg) and getPlayerSaga(cid, 9, 1) then
-- npcHandler:say("I received a report from SunaGakure, Kazekage Gaara was taken by akatsuki, they need our help to {rescue} him, we don't know what they can do!", cid)
sendNpcDialog(cid, getNpcCid(), "Recebi um relato de SunaGakure, Kazekage Gaara foi levado pela akatsuki, eles \nprecisam da nossa ajuda para resgat�-lo, n�o sabemos o que podem fazer!", {"Fechar", "Resgatar", "Nao"})
talkState[talkUser] = 1
elseif isInArray({"seguir", "follow", "go", "following", "move on"}, msg) and getPlayerSaga(cid, 15, 1) then
-- npcHandler:say("Antes que a Akatsuki fa�a outro ataque, o fukasaku prop�s leva-lo para treinar com os sapos no monte myoboku!!", cid)
sendNpcDialog(cid, getNpcCid(), "Antes que a Akatsuki fa�a outro ataque, o fukasaku prop�s leva-lo para treinar \ncom os sapos no monte myoboku!", {"Fechar"})
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif isInArray({"resgata","sim","resgatar", "yes", "rescue"}, msg) and talkState[talkUser] == 1 and getPlayerSaga(cid, 9, 1) then
doPlayerNextSaga(cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
elseif msg == "nao" then  
selfSay("Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe", cid)  
sendNpcDialog(cid, getNpcCid(), "Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe.", {"Fechar"})
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())