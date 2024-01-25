local function nevoa()
local pos = {x=(math.random(992,997)), y=(math.random(895,899)), z=7} 
for i=1, 4 do
doSendMagicEffect(pos, 460)
end
end

function onThink(cid, interval, lastExecution)
addEvent(nevoa, 100)
return true
end