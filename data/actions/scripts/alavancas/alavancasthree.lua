local alavancas = {
{action = 14316, pos = {x = 1150, y = 2042, z = 10}, sto = 63251},
{action = 14317, pos = {x = 1150, y = 2043, z = 10}, sto = 63252},
{action = 14318, pos = {x = 1150, y = 2044, z = 10}, sto = 63253}
}

local function selectPillar(aid)
for _, act in pairs(alavancas) do
    if act.action == aid then
    return act
    end
end
end


function onUse(cid, item, frompos, item2, topos)
if item.itemid == 1946 then return doTransformItem(item.uid,1945) end
local alavanca = selectPillar(item.actionid)
local seetime = getGlobalStorageValue(alavanca.sto)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
if getGlobalStorageValue(alavanca.sto) > os.time() then return doPlayerSendCancel(cid,"Wait "..minutes.." minutes and "..seconds.." seconds to enter the quest!") end
local removepillar = removeItemPosition(3766, alavanca.pos)
    if removepillar then
    addEvent(doCreateItem , 60 * TIME_SECONDS, 3766, 1, alavanca.pos)
	doCreatureSay(cid, "!Parece que algo aconteceu...!", 19)
    end
end