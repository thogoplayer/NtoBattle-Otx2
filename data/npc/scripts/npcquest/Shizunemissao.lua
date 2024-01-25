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
if(msgcontains(msg, 'missoes')) then
selfSay('Ok, Para começar vamos fazer a {primeira missao}?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'primeira missao')) then
	if (getPlayerStorageValue(cid,111) == 0) then
			selfSay('Mate alguns nekenins e me traga 10 Nukenin {talisma}', cid)
			talkState[talkUser] = 1
				elseif(msgcontains(msg, 'talisma') and talkState[talkUser] == 1) then
					setPlayerStorageValue(cid,111,1)
					selfSay('Obrigado! Se quiser ja podes fazer a {segunda missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
				end
		elseif (getPlayerStorageValue(cid,111) == 1) then
			selfSay('Mate alguns nekenins e me traga 10 Nukenin {pão}', cid)
			talkState[talkUser] = 1
				elseif(msgcontains(msg, 'pão') and talkState[talkUser] == 1) then
					setPlayerStorageValue(cid,111,1)
					selfSay('Obrigado! Se quiser ja podes fazer a {segunda missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
				end
	end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())