local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'konohagakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 10000, destination = {x = 2027, y = 2008, z = 7} })
local travelNode = keywordHandler:addKeyword({'sunagakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 150, cost = 10000, destination = {x = 1393, y = 2104, z = 7} })
local travelNode = keywordHandler:addKeyword({'kirigakure'},StdModule.travel, {npcHandler = npcHandler, premium = false, level = 300, cost = 10000, destination = {x = 2215, y = 2438, z = 7} })
local travelNode = keywordHandler:addKeyword({'amegakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 225, cost = 10000, destination = {x= 1572, y=2144, z= 7} })
local travelNode = keywordHandler:addKeyword({'west desert'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 175, cost = 10000, destination = {x = 2781, y = 2157, z = 7} })
local travelNode = keywordHandler:addKeyword({'yu no kuni'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 200, cost = 10000, destination = {x = 2539, y = 1759, z = 7} })
local travelNode = keywordHandler:addKeyword({'kumogakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 300, cost = 10000, destination = {x = 2662, y = 1555, z = 7} })
local travelNode = keywordHandler:addKeyword({'getsugakure'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 1, cost = 0, destination = {x = 3144, y = 1796, z = 7} })
local travelNode = keywordHandler:addKeyword({'south island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 150, cost = 10000, destination = {x = 1708, y = 2301, z = 7} })
local travelNode = keywordHandler:addKeyword({'south florest'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 100, cost = 10000, destination = {x= 2063, y=2327, z= 7} })
local travelNode = keywordHandler:addKeyword({'west florest'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 225, cost = 10000, destination = {x = 2787, y = 2415, z = 7} })
local travelNode = keywordHandler:addKeyword({'iwagakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 200, cost = 10000, destination = {x = 970, y = 1599, z = 7} })
local travelNode = keywordHandler:addKeyword({'guild castle'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 200, cost = 10000, destination = {x = 3591, y = 2118, z = 7} })


        keywordHandler:addKeyword({'viagem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso leva-lo para {KonohaGakure}, {SunaGakure}, {KiriGakure}, {Amegakure}, {Kumogakure}, {Getsugakure}, {Yu No Kuni}, {West Desert}, {South island}, {South Forest}, {West Florest}, {Iwagakure} e {Guild Castle}.'})
		keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to {KonohaGakure}, {SunaGakure}, {KiriGakure}, {Amegakure}, {Kumogakure}, {Getsugakure}, {Yu No Kuni}, {West Desert}, {South island}, {South Forest}, {West Florest}, {Iwagakure} and {Guild Castle}.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())