TASKSYSTEM_OPCODE_WINDOW = 122 -- opcode que vai enviar pro cliente que vai mostrar as infos da janela de task
TASKSYSTEM_OPCODE_WINDOW_DESTROYINFOS = 123 -- opcode que vai destruir as informacoes antigas
TASKSYSTEM_OPCODE_WINDOW_OPTIONS = 124 -- opcode que vai enviar pro cliente que vai mostrar as info da janela de task (ranks)
TASKSYSTEM_OPTIONS_RANKS = {"E", "D", "C", "B", "A", "S"} -- lista de rankings
TASKSYSTEM_OPTIONS_RANKS_STORAGES = {77237, 77238, 77239, 77240, 77241, 77242} -- lista de opcode de rankings

-- Storages
TASKSYSTEM_PLAYER_POINTS = 52620 -- storage para mostrar quantos pontos o jogador possui
TASKSYSTEM_ISINMISSION_STORAGE = 52535 -- storage para simbolizar que esta em missao
TASKSYSTEM_CATEGORY = 52536 -- storage para representar a categoria

-- Monstros
TASKSYSTEM_MONSTERS = {
    -- Rank E
        [1] = 
        {
            monsters_list = {"Wolf", "Black Wolf", "Ice Wolf"},
            name = "Wolfs",
			elopoints = 1,
            id = 1, -- coloque sempre o id, sempre aumente + 1
            storage = 84280, -- storage do kill
			storageFixa = 84539, -- storage da fixa adicionar +1
            storage2 = 84550, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84434, -- storage para fazer novamente  (ao tentar clicar denovo)
            timeDidAgain = 0, -- horas para fazer novamente (24 horas)
            count = 60, -- quantidade que vai ter que matar
            pontos = 1, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 60 Wolfs.",
            background = "images/backgrounds/Rock.png",-- background da missao
            outfit = 531, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Money
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Fixa", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },

        [2] =
        {
            monsters_list = {"Sand Bug"},
            name = "Sand Bug",
            id = 2, -- coloque sempre o id, sempre aumente + 1
			elopoints = 2,
            storage = 84281, -- storage do kill
            storage2 = 84551, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84435, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 90, -- quantidade que vai ter que matar
            pontos = 2, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 90 Sand Bugs.",
            background = "images/backgrounds/Grass.png",-- background da missao
            outfit = 1225, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },

        [3] =
        {
            monsters_list = {"Sand Cros"},
            name = "Sand Cros",
            id = 3, -- coloque sempre o id, sempre aumente + 1
			elopoints = 2,
            storage = 84282, -- storage do kill
            storage2 = 84552, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84436, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 90, -- quantidade que vai ter que matar
            pontos = 2, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 90 Sand Cros.",
            background = "images/backgrounds/Grass.png",-- background da missao
            outfit = 1095, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[4] =
        {
            monsters_list = {"Assassin Fuuton"},
            name = "Assassin Fuuton",
            id = 4, -- coloque sempre o id, sempre aumente + 1
			elopoints = 3,
            storage = 84283, -- storage do kill
            storage2 = 84553, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84437, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 120, -- quantidade que vai ter que matar
            pontos = 2, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 120 Assassins Fuuton.",
            background = "images/backgrounds/Water.png",-- background da missao
            outfit = 519, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[5] =
        {
            monsters_list = {"Farmer"},
            name = "Farmer",
            id = 5, -- coloque sempre o id, sempre aumente + 1
			elopoints = 3,
            storage = 84284, -- storage do kill
            storage2 = 84554, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84438, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 120, -- quantidade que vai ter que matar
            pontos = 2, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 120 Farmes.",
            background = "images/backgrounds/Rock.png",-- background da missao
            outfit = 521, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[6] =
        {
            monsters_list = {"Fire Shinobi", "Sound Shinobi"},
            name = "Shinobis",
            id = 6, -- coloque sempre o id, sempre aumente + 1
			elopoints = 4,
            storage = 84285, -- storage do kill
            storage2 = 84555, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84439, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 280, -- quantidade que vai ter que matar
            pontos = 3, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 280 Fire Shinobis, Sound Shinobis.",
            background = "images/backgrounds/Fly.png",-- background da missao
            outfit = 522, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[7] =
        {
            monsters_list = {"Human", "Suna Bunshin"},
            name = "Humans e Suna Bunshins",
            id = 7, -- coloque sempre o id, sempre aumente + 1
			elopoints = 4,
            storage = 84286, -- storage do kill
            storage2 = 84556, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84440, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 300, -- quantidade que vai ter que matar
            pontos = 4, -- pontos que o player ganha
            level = 8, -- level da task
            experienceGain = 50000, -- exp que vai ganhar
            description = "Derrote 300 Suna Bunshin ou Humans.",
            background = "images/backgrounds/Fly.png",-- background da missao
            outfit = 522, -- outfit do monstro
            recompenseList = { -- Premios da task
                2160 -- Chave da Dungeon
            }, 
            recompenseList_count = { -- quantidade de premios da task
                50
            }, 
            rank = "E", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[8] =
        {
            monsters_list = {"Akai", "Assassin Sword", "Bandit"},
            name = "Akai, Assassins Sword e Bandits",
            id = 8, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84287, -- storage do kill
            storage2 = 84557, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84441, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 450, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 450 Akais, Bandits e Assassins Swords.",
            background = "images/backgrounds/Fighting.png",-- background da missao
            outfit = 1231, -- outfit do monstro
            recompenseList = {
                18149,
				10365
			}, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[9] =
        {
            monsters_list = {"Dark Snake", "Venom Snake"},
            name = "Dark e Venom Snakes",
            id = 9, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84288, -- storage do kill
            storage2 = 84558, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84442, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 400, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 400 Dark e Venom Snakes.",
            background = "images/backgrounds/Fairy.png",-- background da missao
            outfit = 668, -- outfit do monstro
            recompenseList = {
				18149,
				10364
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[10] =
        {
            monsters_list = {"Desert Shaolin", "Dosu", "Human Mutated"},
            name = "Desert Shaolin, Dosu e Human Mutated",
            id = 10, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84289, -- storage do kill
            storage2 = 84559, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84443, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 500, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 500 Deserts Shaolin, Dosus e Humans Mutated.",
            background = "images/backgrounds/Dragon.png",-- background da missao
            outfit = 611, -- outfit do monstro
            recompenseList = {
                18149,
				10364
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[11] =
        {
            monsters_list = {"jounin renegade", "master shinobi"},
            name = "Jounin Renegade e Master Shinobi",
            id = 11, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84290, -- storage do kill
            storage2 = 84560, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84444, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 400, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 400 Jounin Renegade e Master Shinobi.",
            background = "images/backgrounds/Rock.png",-- background da missao
            outfit = 577, -- outfit do monstro
            recompenseList = {
                18149,
				10365
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[12] =
        {
            monsters_list = {"tutor", "shinobi"},
            name = "Tutor e Shinobis",
            id = 12, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84291, -- storage do kill
            storage2 = 84561, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84445, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 400, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 400 Tutor e Shinobis.",
            background = "images/backgrounds/Rock.png",-- background da missao
            outfit = 1181, -- outfit do monstro
            recompenseList = {
                18149,
				10365
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[13] =
        {
            monsters_list = {"rukongai", "shinobi getsugakure", "shinobi skys", "traveller"},
            name = "Rukongai, Shinobis (Getsugakure, Sky), Traveller",
            id = 13, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84292, -- storage do kill
            storage2 = 84562, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84446, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 500, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 500 Rukongai, Shinobis (Getsugakure, Sky), Traveller",
            background = "images/backgrounds/Rock.png",-- background da missao
            outfit = 1351, -- outfit do monstro
            recompenseList = {
                18149,
				10365
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[14] =
        {
            monsters_list = {"yoth", "yoth furie"},
            name = "Yoths",
            id = 14, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84293, -- storage do kill
            storage2 = 84563, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84447, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 400, -- quantidade que vai ter que matar
            pontos = 6, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 400 Yoths e Yoths Furies",
            background = "images/backgrounds/Fire.png",-- background da missao
            outfit = 553, -- outfit do monstro
            recompenseList = {
                18149,
				10364
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		
		[15] =
        {
            monsters_list = {"Giant Fear", "dog fear", "insect", "kabutomushi", "sand storm"},
            name = "Giant Fear, Dog Fear, Insect, Kabutomushi e Sand storm",
            id = 15, -- coloque sempre o id, sempre aumente + 1
			elopoints = 10,
            storage = 84294, -- storage do kill
            storage2 = 84564, -- storage para para nao ficar mostrando botao de coletar
            storageDidAgain = 84448, -- storage para fazer novamente
            storageFixa = 2000, -- storage da fixa adicionar +1
            timeDidAgain = 86400, -- horas para fazer novamente (24 horas)
            count = 550, -- quantidade que vai ter que matar
            pontos = 7, -- pontos que o player ganha
            level = 100, -- level da task
            experienceGain = 100000, -- exp que vai ganhar
            description = "Derrote 550 Giant Fear, Dog Fear, Insect, Kabutomushi e Sand storm",
            background = "images/backgrounds/Fire.png",-- background da missao
            outfit = 637, -- outfit do monstro
            recompenseList = {
                18149,
				10364
            }, 
            recompenseList_count = { -- quantidade de premios da task
                1,
				10
            }, 
            rank = "D", -- coloque o ranking do monstro pra quando for trocar de categoria ele puxar daqui
            type = "Diária", -- se for uma task que ? di?ria deixa di?ria, se n?o, deixa Fixa: type = "Fixa"
        },
		

}


TASKSYSTEM_ADVANCE_RANKING_POINTS = { -- coloque de acordo com o valor da storage de cada ranking
    ["E"] = {nextRanking = 77238, nextRankingPoints = 50, description = "Rank E"}, -- rank d
    ["D"] = {nextRanking = 77239, nextRankingPoints = 190, description = "Rank D"}, -- rank c
    ["C"] = {nextRanking = 77240, nextRankingPoints = 760, description = "Rank C"}, -- rank b
    ["B"] = {nextRanking = 77241, nextRankingPoints = 848, description = "Rank B"}, -- rank a
    ["A"] = {nextRanking = 77242, nextRankingPoints = 1000, description = "Rank A"}, -- rank s
}

-- Destruir informacoes anteriores da janela
function destroyInfos(cid)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW_DESTROYINFOS, "rankings".."@")
    doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW_DESTROYINFOS, "monsters".."@")
    return true
end

-- Enviar a janela de Task
function sendTaskWindow(cid, rank)
    if not isPlayer(cid) then
        return true
    end

    destroyInfos(cid) -- destruir informacoes
    for i = 1, #TASKSYSTEM_OPTIONS_RANKS do
        if getPlayerStorageValue(cid, TASKSYSTEM_OPTIONS_RANKS_STORAGES[i]) >= 1 then
            doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW_OPTIONS, TASKSYSTEM_OPTIONS_RANKS[i].."@"..i.."@".."unlocked".."@")
        else
            doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW_OPTIONS, TASKSYSTEM_OPTIONS_RANKS[i].."@"..i.."@".."locked".."@")
        end
    end

    for k, v in ipairs(TASKSYSTEM_MONSTERS) do
        if v.rank == rank then
            local status = getPlayerStorageValue(cid, v.storageDidAgain) or 0
            local showRecompenseButton = getPlayerStorageValue(cid, v.storage2) or 0
            if status - os.time() > 0 and showRecompenseButton ~= -1 then
                doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW, v.background.."@"..v.outfit.."@"..k.."@"..getPlayerStorageValue(cid, v.storage).."@"..v.count.."@"..v.description.."@"..v.level.."@"..v.experienceGain.."@"..v.pontos.."@"..v.rank.."@"..v.id.."@".."accepted".."@"..v.type.."@"..getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS).."@"..v.name.."@"..getPlayerStorageValue(cid, v.storageFixa).."@")
            else
                doSendPlayerExtendedOpcode(cid, TASKSYSTEM_OPCODE_WINDOW, v.background.."@"..v.outfit.."@"..k.."@"..getPlayerStorageValue(cid, v.storage).."@"..v.count.."@"..v.description.."@"..v.level.."@"..v.experienceGain.."@"..v.pontos.."@"..v.rank.."@"..v.id.."@".."noaccepted".."@"..v.type.."@"..getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS).."@"..v.name.."@"..getPlayerStorageValue(cid, v.storageFixa).."@")
            end
        end
    end

    return true
end

-- Aceitar a task
function doAcceptTask(cid, taskindex, rank)
    if not isPlayer(cid) then
        return true
    end

    
    local task = TASKSYSTEM_MONSTERS[taskindex]
    if not task then
        --print("Monstro: " .. monster .. " nao esta na tabela.")
        return true
    end

    -- Se o rank corresponder ao recebido do cliente
    if task.rank == rank then
        if getPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE) >= 1 then
            doPlayerPopupFYI(cid, "Você já está em uma task.")
            return true
        end

        if getPlayerStorageValue(cid, task.storageFixa) >= 1 then
            doPlayerPopupFYI(cid, "Você já fez essa task!")
            return true
        end

        if getPlayerLevel(cid) < task.level then
            doPlayerPopupFYI(cid, "Você não possui nível suficiente para essa task, o nível necessário é: Lv." .. task.level .. ".")
            return true
        end

        local tempo = getPlayerStorageValue(cid, task.storageDidAgain) or 0
        if task.timeDidAgain > 0 and tempo - os.time() > 0 then
            local time = os.date("*t", tempo - os.time())

            if time and time.hour > 0 then
                doPlayerPopupFYI(cid, "Você já fez essa task, aguarde: " .. time.hour .. " horas para fazer novamente.")
            end

            if time and time.hour <= 0 and time.min > 0 then
                doPlayerPopupFYI(cid, "Você já fez essa task, aguarde: " .. time.min .. " minutos para fazer novamente.")
            end
            return true
        end

        if task.timeDidAgain > 0 then
            setPlayerStorageValue(cid, TASKSYSTEM_CATEGORY, taskindex)
            setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 1) -- setar que ta fazendo alguma task
            setPlayerStorageValue(cid, task.storage, 0) -- setar que tem a task
            setPlayerStorageValue(cid, task.storage2, 0) -- setar que vai mostrar o botao
            setPlayerStorageValue(cid, task.storageDidAgain, os.time() + task.timeDidAgain) -- setar o tempo para fazer novamente

            doPlayerPopupFYI(cid, "Vá derrotar: " .. task.count .. " " .. task.name .. "'s.")
            sendTaskWindow(cid, rank)
        else
            setPlayerStorageValue(cid, TASKSYSTEM_CATEGORY, taskindex)
            setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 1) -- setar que ta fazendo alguma task
            setPlayerStorageValue(cid, task.storage, 0) -- setar que tem a task
            setPlayerStorageValue(cid, task.storage2, 0) -- setar que vai mostrar o botao
            setPlayerStorageValue(cid, task.storageDidAgain, os.time()+999999) -- setar o tempo para fazer novamente
            setPlayerStorageValue(cid, task.storageFixa, 1) -- setar o tempo para fazer novamente

            doPlayerPopupFYI(cid, "Vá derrotar: " .. task.count .. " " .. task.name .. "'s.")
            sendTaskWindow(cid, rank)
        end
    end
    return true
end

-- Coletar a Recompensa
function doCollectTaskRecompense(cid, monster, rank)
    if not isPlayer(cid) then
        return true
    end

    local task = TASKSYSTEM_MONSTERS[monster]
    if not task then
        --print("Monstro: " .. monster .. " nao esta na tabela.")
        return true
    end

    -- Se o rank corresponder ao recebido do cliente
    if task.rank == rank then
        if getPlayerStorageValue(cid, task.storage) >= task.count then
            doPlayerPopupFYI(cid, "Você coletou sua recompensa!")
            setPlayerStorageValue(cid, task.storage, 0)
            setPlayerStorageValue(cid, task.storage2, -1)
            setPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS, getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS) + task.pontos)
            setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 0)

            for i = 1, #task.recompenseList do
                doPlayerAddItem(cid, task.recompenseList[i], task.recompenseList_count[i])
            end

            for i = 1, #TASKSYSTEM_OPTIONS_RANKS do
                local ranking = TASKSYSTEM_OPTIONS_RANKS[i]
		
		        if TASKSYSTEM_ADVANCE_RANKING_POINTS[ranking] and getPlayerStorageValue(cid, TASKSYSTEM_ADVANCE_RANKING_POINTS[ranking].nextRanking) <= 0 then
                     if getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS) >= TASKSYSTEM_ADVANCE_RANKING_POINTS[ranking].nextRankingPoints then
                      	 setPlayerStorageValue(cid, TASKSYSTEM_ADVANCE_RANKING_POINTS[ranking].nextRanking, 1)
		                setPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS, getPlayerStorageValue(cid, TASKSYSTEM_PLAYER_POINTS)-TASKSYSTEM_ADVANCE_RANKING_POINTS[ranking].nextRankingPoints)
                     end
		        end
            end

            doPlayerAddExperience(cid, task.experienceGain)
			doPlayerAddEloPoints(cid, task.elopoints)
            sendTaskWindow(cid, rank)
        else
            doPlayerPopupFYI(cid, "Você ainda não derrotou todos os: " .. task.name .. ".")
        end
    end
    return true
end

-- Cancelar a TASK
function doCancelTask(cid, taskindex, rank)
    if not isPlayer(cid) then
        return true
    end

    local task = TASKSYSTEM_MONSTERS[taskindex]
    if not task then
        --print("Monstro: " .. monster .. " nao esta na tabela.")
        return true
    end

    -- Se o rank corresponder ao recebido do cliente
    if task.rank == rank then
        doPlayerPopupFYI(cid, "Você cancelou a sua TASK de: " .. task.name .. ".")
        setPlayerStorageValue(cid, task.storage, 0)
        setPlayerStorageValue(cid, TASKSYSTEM_ISINMISSION_STORAGE, 0)
        setPlayerStorageValue(cid, task.storageDidAgain, 0)
        setPlayerStorageValue(cid, task.storageFixa, 0)

        sendTaskWindow(cid, rank)
    end
    return true
end

