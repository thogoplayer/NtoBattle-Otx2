local config = {
bosses = {
    {"The Kurama Boss", 15211},
    {"The Hidan Boss", 15212},
    {"The Juubi Boss", 15213},
    },
area = {fromPos = {x = 2716, y = 3545, z = 6},  toPos = {x = 2751, y = 3573, z = 6}}, -- area do evento
teleport = {fromPos = {x= 2412, y=3148, z= 7}, toPos = {x = 2734, y = 3563, z = 6}, id = 5023}, -- onde cria, pra onde vai, id
chest = {pos = {x = 2733, y = 3558, z = 7}, id = 18454}, --  onde cria, id
monsterPos = {{x= 2734, y=3548, z= 6}},
time = 5, -- tempo para inicio
eventStorage = 12530
}

local function removeAllCreatureInvasion()
    local players = getAllPlayersInArea(config.area.fromPos, config.area.toPos)
    local check = 0
    for _, player in ipairs(players) do
	doCreatureAddHealth(player, getCreatureMaxHealth(player))
    doTeleportThing(player, getTownTemplePosition(getPlayerTown(player)))
    check = check + 1
    end
	
    local monsters = getAllMonstersInArea(config.area.fromPos, config.area.toPos)
    for _, monster in ipairs(monsters) do
	doRemoveCreature(monster)
    end
return check
end

local function resetInvasion()
setGlobalStorageValue(config.eventStorage, -1)
removeAllCreatureInvasion()
    local tp = getTileItemById(config.teleport.fromPos,config.teleport.id).uid
    if tp > 0 then
    doRemoveItem(tp)
    end
	local chest = getTileItemById(config.chest.pos,config.chest.id).uid 
	if chest ~= 0 then
    doRemoveItem(chest)
    end
end
	
local function startInvasion(boss) 
    if #getAllPlayersInArea(config.area.fromPos, config.area.toPos) < 1 then
    resetInvasion()
    doBroadcastMessage("Evento Bosses foi cancelado por falta de participantes!", MESSAGE_EVENT_ADVANCE)
    return true
    end
	local tp = getTileItemById(config.teleport.fromPos,config.teleport.id).uid
    if tp > 0 then
    doRemoveItem(tp)
    end
	
    local chest = doCreateItem(config.chest.id,1,config.chest.pos)
    doCreateMonster(boss[1], config.monsterPos[math.random(1,#config.monsterPos)])
    doItemSetAttribute(chest, "uid", boss[2])
    doBroadcastMessage("O evento Bosses começou!", MESSAGE_EVENT_ADVANCE)
end
	
	
function onTime(interval)
    local boss = config.bosses[math.random(1,#config.bosses)]
        if (boss) then
        resetInvasion()
        setGlobalStorageValue(config.eventStorage,1)
        doBroadcastMessage("O evento Bosses esta Aberto!! o teleport fechara em "..(config.time).." minuto"..(config.time > 1 and "s" or "").."! BOSS: "..boss[1].."", MESSAGE_EVENT_ADVANCE)
        if getTileItemById(config.teleport.fromPos,config.teleport.id).uid <= 0 then
    doCreateTeleport(config.teleport.id, config.teleport.toPos, config.teleport.fromPos)
    end
	local event = addEvent(startInvasion, config.time*TIME_MINUTES, boss)
        setGlobalStorageValue(1200,event)
    end
return true
end