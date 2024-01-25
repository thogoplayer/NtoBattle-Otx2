local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'east'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 250, cost = 0, destination = {x = 3687, y = 2190, z = 7} })
local travelNode = keywordHandler:addKeyword({'west'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 250, cost = 0, destination = {x = 3496, y = 2182, z = 7} })
local travelNode = keywordHandler:addKeyword({'konoha'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 250, cost = 0, destination = {x = 2027, y = 2008, z = 7} })

        keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'bem, você quer ir para o {East} ou {West} da ilha? ou deseja ir para {Konoha}?.'})
		keywordHandler:addKeyword({'ilha'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well, do you want to go to the {East} or {West} of the island? or want to go to {Konoha}?.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())