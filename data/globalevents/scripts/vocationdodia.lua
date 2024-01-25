local vocs = {1,10,20,30,40,70,80,90,100,110,120,130,140,170,180,190,200,210,250,260,270,280,290,300,320,330,340,350,360,370,380}

function onTime(interval)
if not getStorage(25001) then
setGlobalStorageValue(25001, -1)
end
if not getStorage(25002) then
setGlobalStorageValue(25002, -1)
end

local vocationid = vocs[math.random(1,#vocs)]
local vocname = getVocationInfo(vocationid).name
setGlobalStorageValue(25000, vocationid)
setGlobalStorageValue(25002, vocname)
doBroadcastMessage("[Vocation Day System]\n A vocação escolhida foi "..vocname..", e tera seu ml aumentado em 15 durante 24 horas", 21)
doSaveServer()
return true
end 