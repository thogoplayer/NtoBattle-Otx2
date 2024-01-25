local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local condition = Condition(CONDITION_BLEEDING)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(1200, 500, -100)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local aa, bb, cc, dd, ee, ff = 0
	local player = Player(cid)
		
		if msgcontains(msg, "help") then
			npcHandler:say("I can offer you some {daily tasks}.", cid)
		elseif msgcontains(msg, "task") or msgcontains(msg, "tasks") or msgcontains(msg, "daily") or msgcontains(msg, "tarefa") or  msgcontains(msg, "tarefas") or msgcontains(msg, "diaria") then
			if player:getStorageValue(DT_STORAGES.HAVE_STARTED) > 0 then
				return npcHandler:say("You have already started your daily task today.", cid)
			elseif player:getStorageValue(DT_STORAGES.HAVE_STARTED) == -2 then
				return npcHandler:say("You have already completed your daily task today.", cid)
			end
			npcHandler:say("I have tasks of level {Easy}, {Medium}, {Hard} and {Expert}. Which one do you want to do?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("What are you talking about??", cid)
		end
		
	if npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "easy") then
		if DT_PREMIOQTDE_EASY > 0 then
			npcHandler:say("Your EASY daily task today is: Kill {".. DT_NEEDKILL_EASY .."} {".. DT_CHOSENTASK_EASY .."}(s).\nIf you finish before {6:00am (GTM-3)}, you will receive:\n*{".. DT_PREMIOQTDE_EASY .."}x "..getAllTableText(DT_PRIZENAME_EASY, "or")..", chosen at random;\n*{"..DT_PREMIOFIXO_QTDE_EASY.."}x "..DT_PREMIOFIXO_NAME_EASY..";\n*{"..DT_EXPPRIZE_EASY.."} Experience points;\n*{"..DT_TASKPOINTS_EASY.."}x Task Point.\nDo you want to start this {EASY} task?", cid)
		else
			npcHandler:say("Your EASY daily task today is: Kill {".. DT_NEEDKILL_EASY .."} {".. DT_CHOSENTASK_EASY .."}(s).\nIf you finish before {6:00am (GTM-3)}, you will receive:\n*{"..DT_PREMIOFIXO_QTDE_EASY.."}x "..DT_PREMIOFIXO_NAME_EASY..";\n*{"..DT_EXPPRIZE_EASY.."} Experience points;\n*{"..DT_TASKPOINTS_EASY.."}x Task Point.\nDo you want to start this {EASY} task?", cid)
		end
			npcHandler.topic[cid] = 3
		elseif msgcontains(msg, "medium") then
			npcHandler:say("Your MEDIUM daily task today is: Kill {".. DT_NEEDKILL_MEDIUM .."}{ ".. DT_CHOSENTASK_MEDIUM .."}(s).\nIf you finish before {6:00am (GTM-3)}, you will receive:\n*{".. DT_PREMIOQTDE_MEDIUM .."}x "..getAllTableText(DT_PRIZENAME_MEDIUM, "or")..", chosen at random;\n*{"..DT_PREMIOFIXO_QTDE_MEDIUM.."}x "..DT_PREMIOFIXO_NAME_MEDIUM..";\n*{"..DT_EXPPRIZE_MEDIUM.."} Experience points;\n*{"..DT_TASKPOINTS_MEDIUM.."}x Task Point.\nDo you want to start this {MEDIUM} task?", cid)
			npcHandler.topic[cid] = 4		
		elseif msgcontains(msg, "hard") then
			npcHandler:say("Your HARD daily task today is: Kill {".. DT_NEEDKILL_HARD .."}{ ".. DT_CHOSENTASK_HARD .."}(s).\nIf you finish before {6:00am (GTM-3)}, you will receive:\n*{".. DT_PREMIOQTDE_HARD .."}x "..getAllTableText(DT_PRIZENAME_HARD, "or")..", chosen at random;\n*{"..DT_PREMIOFIXO_QTDE_HARD.."}x "..DT_PREMIOFIXO_NAME_HARD..";\n*{"..DT_EXPPRIZE_HARD.."} Experience points;\n*{"..DT_TASKPOINTS_HARD.."}x Task Point.\nDo you want to start this {HARD} task?", cid)
			npcHandler.topic[cid] = 5		
		elseif msgcontains(msg, "expert") then
			npcHandler:say("Your EXPERT daily task today is: Kill {".. DT_NEEDKILL_EXPERT .." }{".. DT_CHOSENTASK_EXPERT .."}(s).\nIf you finish before {6:00am (GTM-3)}, you will receive:\n*{".. DT_PREMIOQTDE_EXPERT .."}x "..getAllTableText(DT_PRIZENAME_EXPERT, "or")..", chosen at random;\n*{"..DT_PREMIOFIXO_QTDE_EXPERT.."}x "..DT_PREMIOFIXO_NAME_EXPERT..";\n*{"..DT_EXPPRIZE_EXPERT.."} Experience points;\n*{"..DT_TASKPOINTS_EXPERT.."}x Task Point.\nDo you want to start this {EXPERT} task?", cid)
			npcHandler.topic[cid] = 6		
		end
	end
	if msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 3 then	
		npcHandler:say("Ok, don't waste time! You must kill all these monsters and return to receive your reward before {6:00 am}(GMT-3).", cid)
		player:setStorageValue(DT_STORAGES.EASY, 0)
		player:setStorageValue(DT_STORAGES.HAVE_STARTED, 1)
		elseif npcHandler.topic[cid] == 4 then
		npcHandler:say("Ok, don't waste time! You must kill all these monsters and return to receive your reward before {6:00 am}(GMT-3).", cid)
		player:setStorageValue(DT_STORAGES.MEDIUM, 0)
		player:setStorageValue(DT_STORAGES.HAVE_STARTED, 2)
		elseif npcHandler.topic[cid] == 5 then
		npcHandler:say("Ok, don't waste time! You must kill all these monsters and return to receive your reward before {6:00 am}(GMT-3).", cid)
		player:setStorageValue(DT_STORAGES.HARD, 0)
		player:setStorageValue(DT_STORAGES.HAVE_STARTED, 3)
		elseif npcHandler.topic[cid] == 6 then
		npcHandler:say("Ok, don't waste time! You must kill all these monsters and return to receive your reward before {6:00 am}(GMT-3).", cid)
		player:setStorageValue(DT_STORAGES.EXPERT, 0)
		player:setStorageValue(DT_STORAGES.HAVE_STARTED, 4)
		end		
	end

	if msgcontains(msg, "report") then
		if player:getStorageValue(DT_STORAGES.HAVE_STARTED) == 1 then
			if player:getStorageValue(DT_STORAGES.EASY) >= DT_NEEDKILL_EASY then
				npcHandler:say("Just in time! Here are your rewards, come back tomorrow for another task!", cid)
				player:setStorageValue(DT_STORAGES.HAVE_STARTED, -2)
				
				player:addExperience(DT_EXPPRIZE_EASY) --exp
				
				player:addItem(DT_PREMIOFIXO_ID_EASY, DT_PREMIOFIXO_QTDE_EASY) --fixo
				if DT_PREMIOQTDE_EASY > 0 then --rand
					if DT_PREMIOQTDE_EASY == 1 then --rand
						aa = math.random(#DT_PRIZEID_EASY)
						player:addItem(DT_PRIZEID_EASY[aa], 1)
					else
						for i = 1, tonumber(DT_PREMIOQTDE_EASY) do
							aa = math.random(#DT_PRIZEID_EASY)
							player:addItem(DT_PRIZEID_EASY[aa], 1)
						end
					end
				end
			else
				npcHandler:say("You haven't finished your task yet. You still have to kill {"..DT_NEEDKILL_EASY - player:getStorageValue(DT_STORAGES.EASY) .."} "..DT_CHOSENTASK_EASY.."(s).", cid)
			end			
		elseif player:getStorageValue(DT_STORAGES.HAVE_STARTED) == 2 then
			if player:getStorageValue(DT_STORAGES.MEDIUM) >= DT_NEEDKILL_MEDIUM then
				npcHandler:say("Just in time! Here are your rewards, come back tomorrow for another task!", cid)
				player:setStorageValue(DT_STORAGES.HAVE_STARTED, -2)
				
				player:addExperience(DT_EXPPRIZE_MEDIUM) --exp
				
				player:addItem(DT_PREMIOFIXO_ID_MEDIUM, DT_PREMIOFIXO_QTDE_MEDIUM) --fixo
				
				if DT_PREMIOQTDE_MEDIUM > 0 then --rand
					if DT_PREMIOQTDE_MEDIUM == 1 then --rand
						aa = math.random(#DT_PRIZEID_MEDIUM)
						player:addItem(DT_PRIZEID_MEDIUM[aa], 1)
					else
						for i = 1, tonumber(DT_PREMIOQTDE_MEDIUM) do
							aa = math.random(#DT_PRIZEID_MEDIUM)
							player:addItem(DT_PRIZEID_MEDIUM[aa], 1)
						end
					end
				end
			else
				npcHandler:say("You haven't finished your task yet. You still have to kill {"..DT_NEEDKILL_MEDIUM - player:getStorageValue(DT_STORAGES.MEDIUM) .."} "..DT_CHOSENTASK_MEDIUM.."(s).", cid)
			end	
		elseif player:getStorageValue(DT_STORAGES.HAVE_STARTED) == 3 then
			if player:getStorageValue(DT_STORAGES.HARD) >= DT_NEEDKILL_HARD then
				npcHandler:say("Just in time! Here are your rewards, come back tomorrow for another task!", cid)
				player:setStorageValue(DT_STORAGES.HAVE_STARTED, -2)
				
				player:addExperience(DT_EXPPRIZE_HARD) --exp
				
				player:addItem(DT_PREMIOFIXO_ID_HARD, DT_PREMIOFIXO_QTDE_HARD) --fixo
				
				if DT_PREMIOQTDE_HARD > 0 then --rand
					if DT_PREMIOQTDE_HARD == 1 then --rand
						aa = math.random(#DT_PRIZEID_HARD)
						player:addItem(DT_PRIZEID_HARD[aa], 1)
					else
						for i = 1, tonumber(DT_PREMIOQTDE_HARD) do
							aa = math.random(#DT_PRIZEID_HARD)
							player:addItem(DT_PRIZEID_HARD[aa], 1)
						end
					end
				end
			else
				npcHandler:say("You haven't finished your task yet. You still have to kill {"..DT_NEEDKILL_HARD - player:getStorageValue(DT_STORAGES.HARD) .."} "..DT_CHOSENTASK_HARD.."(s).", cid)
			end	
		elseif player:getStorageValue(DT_STORAGES.HAVE_STARTED) == 4 then
			if player:getStorageValue(DT_STORAGES.EXPERT) >= DT_NEEDKILL_EXPERT then
				npcHandler:say("Just in time! Here are your rewards, come back tomorrow for another task!", cid)
				player:setStorageValue(DT_STORAGES.HAVE_STARTED, -2)
				
				player:addExperience(DT_EXPPRIZE_EXPERT) --exp
				
				player:addItem(DT_PREMIOFIXO_ID_EXPERT, DT_PREMIOFIXO_QTDE_EXPERT) --fixo
				
				if DT_PREMIOQTDE_EXPERT > 0 then --rand
					if DT_PREMIOQTDE_EXPERT == 1 then --rand
						aa = math.random(#DT_PRIZEID_EXPERT)
						player:addItem(DT_PRIZEID_EXPERT[aa], 1)
					else
						for i = 1, tonumber(DT_PREMIOQTDE_EXPERT) do
							aa = math.random(#DT_PRIZEID_EXPERT)
							player:addItem(DT_PRIZEID_EXPERT[aa], 1)
						end
					end
				end
			else
				npcHandler:say("You haven't finished your task yet. You still have to kill {"..DT_NEEDKILL_EXPERT - player:getStorageValue(DT_STORAGES.EXPERT) .."} "..DT_CHOSENTASK_EXPERT.."(s).", cid)
			end	
		else
			npcHandler:say("Uhn.. What are you talking about??", cid)
			npcHandler.topic[cid] = 0
		end
	end
end
npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME| i've some {tasks} for u.")
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())