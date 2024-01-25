
local config = {
    wallArea = {
        {0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
        {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
        {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
        {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
        {1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
        {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
        {0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
        {0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0}, 
    },
    effect = 197,          --Efeito.
    wallId = 14463,          --ID da parede.
    time = 6,              --Duração da parede.
    cooldown = 30,   --{sucessCooldown, failCooldown},
    storage = 9571,
}
function onCastSpell(cid)
if getPlayerStorageValue(cid, 16700) >= 1 then doPlayerSendCancel(cid, "Voce nao pode usar esta Spell dentro do Evento!") return false end
if getPlayerStorageValue(cid, config.storage) > os.time() then doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).") return false end

local positions = {}

setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
for _, pos in pairs(getPosfromArea(cid, config.wallArea)) do
    if isWalkable(pos) then
    doCreateItem(config.wallId, 1, pos)
    doSendMagicEffect(pos, config.effect)
    table.insert(positions, pos)
    end
end
addEvent(removeItemPositions, config.time * 1000, config.wallId, positions)
return true
end