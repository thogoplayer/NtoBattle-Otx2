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
    {action = 7001, pos = {x= 2606, y=1855, z= 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
	{action = 7002, pos = {x= 2622, y=1855, z= 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
	{action = 7003, pos = {x= 2637, y=1855, z= 7, stackpos=2}, squares = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}},
}

local rewards = {
    {itemid = 2495, chance = 90},
	{itemid = 11073, chance = 60},
	{itemid = 11678, chance = 80},
	{itemid = 7463, chance = 80},
	{itemid = 2486, chance = 80},
	{itemid = 10423, chance = 80},
	{itemid = 10708, chance = 80},
	{itemid = 10381, chance = 80},
	{itemid = 10415, chance = 80},
	{itemid = 10412, chance = 80},
	{itemid = 10430, chance = 80},
	{itemid = 12445, chance = 80},
	{itemid = 7372, chance = 80},
	{itemid = 11677, chance = 80},
	{itemid = 10496, chance = 80},
	{itemid = 11162, chance = 80},
	{itemid = 12442, chance = 80},
	{itemid = 12315, chance = 80},
	{itemid = 10402, chance = 80},
	{itemid = 7381, chance = 80},
	{itemid = 12301, chance = 80},
	{itemid = 2122, chance = 80},
	{itemid = 11679, chance = 80},
	{itemid = 12254, chance = 80},
	{itemid = 12294, chance = 80},
	{itemid = 10364, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 13925, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 6500, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 7427, chance = 80},
	{itemid = 10378, chance = 80},
	{itemid = 11155, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 5904, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 10712, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 10365, chance = 80, mincount = 20, maxcount = 50},
	{itemid = 10494, chance = 10},
	{itemid = 10449, chance = 1},
	{itemid = 10449, chance = 1},
	{itemid = 8852, chance = 0.5},
    {itemid = 2160, chance = 90, mincount = 20, maxcount = 50},
}
 
local vales = {
    {id = 2122, rewards = 1},
    {id = 10541, rewards = 2}
}

---------------------------------------NAO MEXER---------------------------------------
---------------------------------------------------------------------------------------
-------------------SISTEMA ROLETA BY JEANFERSON AND NIGHT WOLF <3-------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

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
	local quantity = (n.type > 0 and n.type or 1)
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
        doCreatureSetNoMove(uid, 0)
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
            doCreatureSetNoMove(cid, 1)
        else
            doPlayerSendCancel(cid, "Para girar a roleta você precisa de um vale roleta.")
        end
    else
        doPlayerSendCancel(cid, "A roleta ja foi ativada, aguarde até que o premio seja escolhido")
    end
 
return true
end