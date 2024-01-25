local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end


local travelNode = keywordHandler:addKeyword({'lutar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'HAHAHAHA, um mero academico quer mesmo lutar contra um Chunin, sabes que nao tem chance, esta mesmo preparado?{yes}'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 1, cost = 0, destination = {x=1083, y=919, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Hahahaha, sabia que voce era fraco, fuja seu verme, fuja pra bem longe.'})

        keywordHandler:addKeyword({'desabylited'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Comando desabilitado.'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())