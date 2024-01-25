local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'suna'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=564, y=1145, z=7} })

local travelNode = keywordHandler:addKeyword({'mist'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1149, y=1218, z=7} })

local travelNode = keywordHandler:addKeyword({'konoha'},StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1020, y = 904, z = 7} })

local travelNode = keywordHandler:addKeyword({'amegakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=972, y=1430, z=7} })

local travelNode = keywordHandler:addKeyword({'vale do fim'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 968, y = 831, z = 7} })

local travelNode = keywordHandler:addKeyword({'south florest'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 911, y = 1181, z = 7} })

local travelNode = keywordHandler:addKeyword({'west desert'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1496, y=1053, z=7} })

local travelNode = keywordHandler:addKeyword({'south island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1084, y=1400, z=7} })

local travelNode = keywordHandler:addKeyword({'ice island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1999, y = 1120, z = 7} })

local travelNode = keywordHandler:addKeyword({'ilhota'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1106, y = 1535, z = 7} })

local travelNode = keywordHandler:addKeyword({'east island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 880, y = 1476, z = 7} })

local travelNode = keywordHandler:addKeyword({'area de invasao'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1284, y = 844, z = 7} })

local travelNode = keywordHandler:addKeyword({'demon island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 319, y = 940, z = 7} })

local travelNode = keywordHandler:addKeyword({'hoshigakure'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 1, cost = 0, destination = {x = 1654, y = 903, z = 7} })

local travelNode = keywordHandler:addKeyword({'lost island'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 355, y = 1437, z = 7} })

local travelNode = keywordHandler:addKeyword({'otogakure'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1441, y = 1570, z = 6} })

local travelNode = keywordHandler:addKeyword({'thorsend hunter'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 1785, y = 2926, z = 7} })

local travelNode = keywordHandler:addKeyword({'yu no kuni'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 100, cost = 0, destination = {x = 8241, y = 1666, z = 7} })

local travelNode = keywordHandler:addKeyword({'monte myoboku'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x = 829, y = 631, z = 6} })


        keywordHandler:addKeyword({'teleportar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso leva-lo para {Suna}, {Mist}, {Konoha}, {Amegakure}, {Vale Do Fim}, {South Florest}, {South Island}, {West Desert}, {East island}, {area de invasao}, {Ilhota}, {Hoshigakure}, {Demon island}, {Otogakure}, {Thorsend Hunter}, {Yu No Kuni}, {Monte Myoboku}, {Lost Island} and {Ice Island}.'})
		keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso leva-lo para {Suna}, {Mist}, {Konoha}, {Amegakure}, {Vale Do Fim}, {South Florest}, {South Island}, {West Desert}, {East island}, {area de invasao}, {Ilhota}, {Hoshigakure}, {Demon island}, {Otogakure}, {Thorsend Hunter}, {Yu No Kuni}, {Monte Myoboku}, {Lost Island} and {Ice Island}.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())