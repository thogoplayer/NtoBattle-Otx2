local travel = {
	["Mercador"] = {
		route = {{4,EAST},{2,NORTH},{8,WEST},{2,SOUTH},{4,EAST}}
	}
}
local function Andar(cid, route)
M = 0
for MOVE = 1, #route do
M = M + route[MOVE][1]
end
t = 1
r = 1
for i= 1, M do
if isCreature(cid) then
addEvent(doMoveCreature, i*500, cid, route[r][2], 1)
end
t = t +1
if t > route[r][1] then
r = r + 1
t = 1
end
end
end

function onThink(cid, interval, lastExecution)
for _,i in pairs(travel) do
pid = getCreatureByName(i)
if pid then
Andar(pid, i.route)
end
end
return true
end 