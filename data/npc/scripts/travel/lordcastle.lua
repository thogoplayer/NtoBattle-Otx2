local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


local travelNode = keywordHandler:addKeyword({'paradiziac island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 730, y = 427, z = 7} })

local travelNode = keywordHandler:addKeyword({'akuma no shima'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1204, y = 603, z = 7} })

local travelNode = keywordHandler:addKeyword({'dark'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1122, y = 596, z = 7} })




        keywordHandler:addKeyword({'viagem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso leva-lo para {Paradiziac island}, {Akuma No Shima} and {Dark}.'})
		keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso leva-lo para {Paradiziac island}, {Akuma No Shima} and {Dark}.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())