---[[ RETIRADO O MATH.RANDOM BY LEOTK & NIGHTWOLF
-- minX e Y : Pegar a posição lado esquerda, cima
-- maxX e Y : Pegar a posição lado direito, baixo
-- Effects : Configurar o id dos efeitos distance e o pingo caindo e o effect e o pingo ao ter contato com uma superficie
-- Chuva de neve esta desativado para ativar basta remover os comentários
-- Retirado a função de criar poça de água também para ativar basta retirar o comentário
-- rain.chance : Quanto maior mais chuva quanto menor menos chuva
-- rain:start : os dois ultimos números configuraveis só ir testando vai mudar a quantidade da chuva e a força também
---]]

local rain = Rain:new()
 
function onThink(interval, lastExecution)
    local minX = 1239
    local minY = 1602
    local maxX = 1251
    local maxY = 1610
	
local frompos = {x=minX, y=minY, z=7}
local topos = {x=maxX, y=maxY, z=7}
 
    local effects = {
        snow = {
            disteffect = 0,
            effect = 738
        },
        rain = {
            disteffect = 0,
            effect = 738
 
        }
    }

		--rain.chance = math.random(10,50)
		--rain:start({fromPos = frompos, toPos = topos}, effects.snow, 300, math.random(100, 500))
	--else
		rain.chance = 100
		rain.createItem = {chance = math.random(0,10), item = {itemid = 2016, type = 1}}
		rain:start({fromPos = frompos, toPos = topos}, effects.rain, 100, 100)
	return TRUE
end