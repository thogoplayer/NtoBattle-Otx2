local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'montanha'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 400, cost = 250000, destination = {x= 2446, y=1647, z= 7} })



        keywordHandler:addKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'aparentemente o unico caminho para ir ate a grande montanha é navegando porem eu descobrir algo impressionante, posso leva-lo ate a {Montanha} por um preço de 25 jp Ienes?.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())