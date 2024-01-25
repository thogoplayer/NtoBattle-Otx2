Congif_Roleta = {
file = "data/logs/Roleta.txt" ,
cooldown = 2,
effGiro = {769,769,769,769,769,769},
effReward = 768,
EffCreatRemove = 10
}

NORTH = {0,-1}
EAST = {1,0}
SOUTH = {0,1}
WEST = {-1,0}
SOUTHWEST = {-1,1}
SOUTHEAST = {1,1}
NORTHWEST = {-1,-1}
NORTHEAST = {1,-1}

local relative_positions = {
    {action = 7001, pos = {x = 2332, y = 3160, z = 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
	{action = 7002, pos = {x = 2348, y = 3160, z = 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
	{action = 7003, pos = {x = 2363, y = 3160, z = 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
	{action = 7004, pos = {x = 2332, y = 3173, z = 7, stackpos=2}, squares = {{4,WEST},{2,SOUTH},{8,EAST},{2,NORTH},{4,WEST}}},
	{action = 7005, pos = {x = 2348, y = 3173, z = 7, stackpos=2}, squares = {{4,WEST},{2,SOUTH},{8,EAST},{2,NORTH},{4,WEST}}},
	{action = 7006, pos = {x = 2363, y = 3173, z = 7, stackpos=2}, squares = {{4,WEST},{2,SOUTH},{8,EAST},{2,NORTH},{4,WEST}}},
}

local rewards = {
    {itemid = 12289, chance = 80},    ---- anbu armor
	{itemid = 11241, chance = 70},    ---- jiraya shirt
	{itemid = 10706, chance = 70},    ---- Kunoichi Dressing
	{itemid = 11678, chance = 50},    ---- Yonbi armor
	{itemid = 12442, chance = 90},    ---- chakra boots
	{itemid = 12317, chance = 90},    ---- speed boots
	{itemid = 10414, chance = 65},    ---- jiraya slip
	{itemid = 7343, chance = 70},     ---- fur bag
	{itemid = 7342, chance = 30},     ---- fur back
	{itemid = 11237, chance = 40},    ---- necromantic back
	{itemid = 5921, chance = 50},     ---- enchantament crystal
	{itemid = 15792, chance = 50},    ---- akat ring
	{itemid = 17090, chance = 90},    ---- ticket
	{itemid = 15770, chance = 50},    ---- uchiha of necklace
	{itemid = 15487, chance = 80},    ---- nara amuleto
	{itemid = 16472, chance = 40},    ---- kote
	{itemid = 14327, chance = 50},    ---- uchiha forehead
	{itemid = 14356, chance = 50},    ---- uchiha tunic   
	{itemid = 14328, chance = 50},    ---- uchiha legs          
	{itemid = 14326, chance = 50},    ---- uchiha boots                            
	{itemid = 11682, chance = 30},              
	{itemid = 11105, chance = 30},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 11669, chance = 30},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 11106, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 16641, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 10443, chance = 10},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 11123, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 11160, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 2397, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 17454, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 11045, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 18559, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 10496, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 7463, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 17630, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 12443, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 18328, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 18330, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 18327, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 18329, chance = 20},  ---- daqui pra baixo são novo adicionados de nivel baixo/medio                              
	{itemid = 19266, chance = 1},  ---- mifune                              
	{itemid = 11199, chance = 30},                               
	{itemid = 11198, chance = 30},                          
	{itemid = 10364, chance = 80, mincount = 35, maxcount = 100},
	{itemid = 13925, chance = 80, mincount = 15, maxcount = 60},
	{itemid = 6500, chance = 80, mincount = 15, maxcount = 60},
	{itemid = 11155, chance = 80, mincount = 60, maxcount = 100},
	{itemid = 5904, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 10712, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 10365, chance = 80, mincount = 35, maxcount = 100},
    {itemid = 2160, chance = 90, mincount = 20, maxcount = 100},
    {itemid = 14258, chance = 60, mincount = 20, maxcount = 70},
    {itemid = 14259, chance = 60, mincount = 20, maxcount = 70},
    {itemid = 16476, chance = 80, mincount = 20, maxcount = 50},
    {itemid = 16473, chance = 80, mincount = 20, maxcount = 50},
    {itemid = 16474, chance = 80, mincount = 20, maxcount = 50},
    {itemid = 16477, chance = 80, mincount = 20, maxcount = 50},
    {itemid = 16475, chance = 80, mincount = 20, maxcount = 50},
}
 
local vales = {
    {id = 17090, rewards = 1},
    {id = 18487, rewards = 2}
}

---------------------------------------NAO MEXER---------------------------------------
---------------------------------------------------------------------------------------
-------------------SISTEMA ROLETA BY JEANFERSON AND NIGHT WOLF <3-------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

-- local function NewPos(pos, dir)
-- return {x= pos.x+dir[1], y=pos.y+dir[2], z=pos.z}
-- end

local function ConfigPos(action_id)
    for i, v in pairs(relative_positions) do
    if v.action == action_id then
	  return v
    end
	end
end

local function Postitions(action)
local positions = {}
pos = ConfigPos(action).pos
SQM = ConfigPos(action).squares
M = 0
for MOVE = 1, #SQM do
M = M + SQM[MOVE][1]
end
t = 1
r = 1
for i= 1, M do
positions[#positions + 1] = pos
pos = {x= pos.x+SQM[r][2][1], y=pos.y+SQM[r][2][2], z=pos.z, stackpos = pos.stackpos}
-- pos = NewPos(pos, selected.squares[r][2])
t = t +1
if t > SQM[r][1] then
r = r + 1
t = 1
end

end
return positions
end


local function sorteiaPremio(rewards)
    local possible = {}
    for i, v in pairs(rewards) do
        local sort = math.random(1, 10000)
        if v.chance*100 >= sort then
            possible[#possible + 1] = v
        end
    end
    local reward = rewards[1]
    if #possible > 0 then
        reward = possible[math.random(1, #possible)]
    end
   
    return reward
end
 
local function CriarItens(positions)
    for i = 1, #positions do
        doSendMagicEffect(positions[i], Congif_Roleta.EffCreatRemove)
        local p = sorteiaPremio(rewards)
        local minimo, maximo = p.mincount and p.mincount or 1, p.maxcount and p.maxcount or 1   
        local items = doCreateItemEx(p.itemid, math.random(minimo, maximo))
        doTileAddItemEx(positions[i], items)
    end
end
 
local function RemoveItens(positions, storage, storage2)
for i= 1, #positions do
local n = getTileThingByPos(positions[i])    
doSendMagicEffect(positions[i], Congif_Roleta.EffCreatRemove)
doRemoveItem(n.uid)
end
setGlobalStorageValue(storage2, Congif_Roleta.cooldown + os.time())
setGlobalStorageValue(storage, 0)
end
 
local function Rewards(uid, rewardpos)
    local text = io.open(Congif_Roleta.file, "a+")
    local n = getTileThingByPos(rewardpos)
    if isCreature(uid) then
	local quantity = n.type > 0 and n.type or 1
        doPlayerAddItem(uid, n.itemid, quantity)
        doBroadcastMessage("[Roleta System]\nO player "..getCreatureName(uid).." ganhou "..quantity.." "..getItemNameById(n.itemid).."s, Parabens!")
        doPlayerSendTextMessage(uid, 19,"[Roleta System] Seu premio foi "..quantity.." "..getItemNameById(n.itemid).."s, Parabens!")
        text:write("["..os.date("%d/%m/%Y %X", os.time()).."] O jogador "..getPlayerName(uid).." ["..getPlayerLevel(uid).."] ganhou "..quantity.." "..getItemNameById(n.itemid)..".\n")
    end
end



local function Girar(uid, Contagem, rounds, Moves, positions, rewards, storage, storage2)
    local r = Contagem - #positions * rounds
  if Contagem ~= Moves then
    doSendMagicEffect(positions[r], Congif_Roleta.effGiro[rewards])
      if r == #positions then 
        rounds = rounds + 1
      end
    Contagem = Contagem + 1
    addEvent(Girar, (Contagem*2)+40,uid, Contagem, rounds, Moves, positions, rewards, storage, storage2)
  else
    doSendMagicEffect(positions[r], Congif_Roleta.effReward)
    addEvent(Rewards, 1900, uid, positions[r])
	    if rewards > 1 then
        addEvent(Girar, 1000, uid, 1, 0, math.random(#positions,#positions*2), positions, rewards-1, storage, storage2)
        else
        doCreatureSetNoMove(uid, false)
        addEvent(RemoveItens, 2000 , positions, storage, storage2) 
    end
  end
end

 
local function getPlayerVale(uid, vales_list)
    for i, v in ipairs(vales_list) do
        if getPlayerItemCount(uid, v.id) > 0 then
            return v
        end
    end
return false
end



function onUse(cid, item, fromPosition, itemEx, toPosition)
    local actionid = item.actionid 
    local storage2 = actionid + 10
	local pos = Postitions(actionid)
	local Moves = math.random(#pos*3,#pos*5)
    if getGlobalStorageValue(storage2) - os.time() <= 0 and getGlobalStorageValue(actionid) <= 0 then
    local vale = getPlayerVale(cid, vales)
        if vale and doPlayerRemoveItem(cid, vale.id, 1) then
            CriarItens(pos)
			addEvent(Girar, 1000,cid, 1, 0, Moves, pos, vale.rewards, actionid, storage2)
            setGlobalStorageValue(actionid, 1)
            doCreatureSetNoMove(cid, true)
        else
            doPlayerSendCancel(cid, "Para girar a roleta você precisa de um vale roleta.")
        end
    else
        doPlayerSendCancel(cid, "A roleta ja foi ativada, aguarde até que o premio seja escolhido")
    end
 
return true
end