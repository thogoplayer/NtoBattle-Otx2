local function deathNames(list)
local nameDeaths = {}
for _, pid in ipairs(list) do
if isPlayer(pid) then
table.insert(nameDeaths, " (P)"..getCreatureName(pid))
elseif isMonster(pid) then
table.insert(nameDeaths, " (M)"..getCreatureName(pid))
else
table.insert(nameDeaths, " field item")
end
end
return nameDeaths
end


function onDeath(cid, corpse, deathList)
local str = "Death by"
str = str ..""..table.concat(deathNames(deathList), ",")
str = str .."\n["..os.date("%d/%m/%Y %X", os.time()).."]"
local item = choose(5943)
local corp = doAddContainerItem(corpse.uid, item)
doItemSetAttribute(corp, "name", getCreatureName(cid).." "..getItemNameById(item))
doItemSetAttribute(corp, "description", str)
 return true
end