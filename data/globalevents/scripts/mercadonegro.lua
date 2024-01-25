function onStartup()
	if getStorage(26000) >= 1 then
	doCreateNpc("Mercador", {x= getStorage(26005), y=getStorage(26006), z= getStorage(26007)})
	end
	return true
end

function onTime(interval)
config = {
days = {1,4},
npcname = "mercador",
produto = choose(12441, 18321, 15775, 11041, 10448, 17631, 11666, 12329, 8854, 10415, 14351, 13556, 13628, 15764, 13592, 13547, 17639, 17503, 13595, 13622, 17666, 13557, 13629, 15765, 13593, 13548, 17647, 17504, 13596, 13554, 13623, 17675),
quantidade = math.ceil(math.random(3, 10)),
moeda = choose(18149),
preco = math.ceil(math.random(20, 80))
}

local spawn = {
[1] = {pos = {x = 1991, y = 2085, z = 7}, cidade = "Konoha Gakure No Sato"},
[2] = {pos = {x = 1391, y = 2211, z = 7}, cidade = "Suna Gakure No Sato"},
[3] = {pos = {x = 2488, y = 1844, z = 7}, cidade = "Yu No Kuni"},
[4] = {pos = {x = 2671, y = 1605, z = 7}, cidade = "Kumo Gakure No Sato"},
[5] = {pos = {x = 1549, y = 2149, z = 7}, cidade = "Ame Gakure No Sato"},
[6] = {pos = {x = 2292, y = 2393, z = 7}, cidade = "Kiri Gakure No Sato"},
[7] = {pos = {x = 2292, y = 2393, z = 7}, cidade = "Iwa Gakure No Sato"}
}

local randomm = math.random(1,#spawn)
local spawnpos = spawn[randomm].pos
local nomecidade = spawn[randomm].cidade
local time = os.date("*t")


if (isInArray(config.days, time.wday)) then
-- Storages
setGlobalStorageValue(26000, config.quantidade)  ---- quantidade de produtos
setGlobalStorageValue(26001, config.produto)  ---- id do produto
setGlobalStorageValue(26002, config.preco)  ---- preço do produto
setGlobalStorageValue(26003, config.moeda)  ---- id da moeda
---- Pos
setGlobalStorageValue(26004, nomecidade)  ---- cidade
doCreateNpc(config.npcname, spawnpos)
doBroadcastMessage("[Anunciamento Mercador]\n O npc "..config.npcname.." chegou em "..nomecidade.." trazendo apenas  "..config.quantidade.." unidades de "..getItemNameById(config.produto).."s", 21)
setGlobalStorageValue(26005, spawnpos.x)  ---- posx
setGlobalStorageValue(26006, spawnpos.y)  ---- posy
setGlobalStorageValue(26007, spawnpos.z)  ---- posz
end
return true
end 