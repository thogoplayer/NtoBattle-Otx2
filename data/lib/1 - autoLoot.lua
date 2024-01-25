-- Sistema de Auto Loot Janela --

optionsAvaiable = {"Golds", "Items"} -- opcoes do auto loot disponiveis (adicione la embaixo e aqui)
autoloot_send_options_opcodes = 170 -- opcode que vai enviar de volta apos receber
autoloot_send_items_opcode = 106 -- opcode que vai enviar de volta apos receber (enviar items do aloot)
autoloot_send_destroyCHILD_opcode = 107 -- opcode que vai enviar de volta apos receber (remover os widgets antigos e criar novos)
autoloot_send_items_opcode2 = 108 -- opcode que vai enviar de volta apos receber (enviar items do aloot (troca de categoria))
autoloot_send_items_added_opcode = 109 -- opcode que vai enviar de volta apos receber (enviar items adicionados pelo player)

-- Categorias de Items
local items = {
    ["Golds"] =
    {
        item_id = {2148, 2152, 2160, 18149, 13893, 18320}, -- id dos items
        item_name = {"Coin", "Yen", "Jp Iene", "Ryo", "Gold Bar", "Gold Token"}, -- nome dos items
    },

    ["Items"] =
    {
        item_id = {2383, 2671, 12258, 5468, 2545, 2417, 12266, 12303, 11155, 10449, 3983, 12317, 12284, 10712, 2487, 8305, 2666, 11191, 12257, 13927, 12392, 12445, 11080, 13925, 2654, 12442, 17435, 6500, 12383, 10540, 12387, 12289, 16474, 16473, 16475, 16476, 16477, 12314, 12300, 17428, 12384, 11189, 7426, 12267, 11241, 3968, 5467, 9662, 2381, 11682, 8852, 10495, 12333, 2543, 2480, 17427, 11071, 12381, 11199, 12382, 12328, 10494, 12313, 11452, 10690, 12292, 12295, 5930, 11162, 11198, 12385, 2389, 2380, 12635, 11105, 15481, 11673, 12255, 12380, 12293, 13923, 17436, 10558, 14383, 15783, 17425, 17438, 5925, 5875, 10706, 12028, 10541, 7427, 12316, 17429, 14382, 15791, 15771}, -- id dos items
        item_name = {"Bandit Sword", "Ham", "Lee Glover", "Fire Bug", "Shuriken", "Ninja Sword", "Desert Sulphur", "Sound Glover",
        "Magic Essence", "Gaara Tunic", "Hooligan Pants", "Speed Boots", "Taijutsu Chakra Glover", "Ninjutsu Soldier Pill", "Orochimaru Tunic", "Mother Soil", "Meat", "Giant Eye", "Dual Slayer", "Virus Sample", "Sand Shuriken", "Puppet Hat", "War Shuriken", "Nukenin Taslisma", "Orochimaru LegRobe", "Chakra Boots", "White line", "Renegade Essence", "Green Piece of Cloth", "Small Chakra Potion", "Yellow Piece of Cloth", "Anbu Armor", "Glover Soldier Pill", "Taijutsu Soldier Pill", "Sword Soldier Pill", "Distance Soldier Pill", "Shield Soldier Pill", "Hebi Shirt", "Icy Pants", "Blue Leaf", "Red Piece of Cloth", "Vampire Wing", "Yellow Leaf", "Blue Sulphurs", "Jiraya Shirt", "Jiraya ForeHead", "Canine Fang", "Ghost's Tear", "Densetsu", "Green Ring", "Chouji Armor", "Gaara Pants", "Anbu Mask", "Senbone", "Konoha ForeHead", "CYan Leaf", "Black Anbu Mask", "Demon Dust", "Blue Ring", "White Piece of Cloth", "Akatsuki Hat", "Akatsuki Tunic", "Akatsuki Boots", "Bomb Explosive", "Akatsuki Fragment", "Shuriken Shield", "Elite Kunai", "Freezing Star", "Devil Boots", "Red Ring", "Blue Piece of Cloth", "Demonic Shuriken", "Densetsu", "Fire Rainbow Shield", "Akatsuki shield", "Orochimaru Boots", "Spectro Sword", "Raiton Sword", "Vampire Dust", "Kunai Staff", "Spider Trap", "Golden line", "Blue Sphere Piece", "Demon Flame Essence", "Hanzou ForeHead", "Red Leaf", "Wings of Fire", "Hardened Bone", "Sniper Gloves", "Dressing Kunoichi", "Kabutowari", "Small Health Potion", "Kage Raiton Shuriken", "Raikage Glover", "Lilac Leaf", "Mistic Flame Essence", "Leader Anbu Mask", "Renegade Pants"}, -- nome dos items
    },
}

-- Items disponiveis do auto loot que sao os de cima (nome do item e id: id do item)
local items_avaiables = {
    -- Items
    ["Bandit Sword"] = {id = 2383},
    ["Ham"] = {id = 2671},
    ["Lee Glover"] = {id = 12258},
    ["Fire Bug"] = {id = 5468},
    ["Shuriken"] = {id = 2545},
    ["Ninja Sword"] = {id = 2417},
    ["Desert Sulphur"] = {id = 12266},
    ["Sound Glover"] = {id = 12303},
    ["Magic Essence"] = {id = 11155},
    ["Gaara Tunic"] = {id = 10449},
    ["Hooligan Pants"] = {id = 3983},
    ["Speed Boots"] = {id = 12317},
    ["Taijutsu Chakra Glover"] = {id = 12284},
    ["Ninjutsu Soldier Pill"] = {id = 10712},
	["Orochimaru Tunic"] = {id = 2487},
	["Mother Soil"] = {id = 8305},
	["Meat"] = {id = 2666},
	["Giant Eye"] = {id = 11191},
	["Dual Slayer"] = {id = 12257},
	["Virus Sample"] = {id = 13927},
	["Sand Shuriken"] = {id = 12392},
	["Puppet Hat"] = {id = 12445},
	["War Shuriken"] = {id = 11080},
	["Nukenin Taslisma"] = {id = 13925},
	["Orochimaru LegRobe"] = {id = 2654},
	["Chakra Boots"] = {id = 12442},
	["White line"] = {id = 17435},
	["Renegade Essence"] = {id = 6500},
	["Green Piece of Cloth"] = {id = 12383},
	["Small Chakra Potion"] = {id = 10540},
	["Yellow Piece of Cloth"] = {id = 12387},
	["Anbu Armor"] = {id = 12289},
	["Glover Soldier Pill"] = {id = 16474},
	["Taijutsu Soldier Pill"] = {id = 16473},
	["Sword Soldier Pill"] = {id = 16475},
	["Distance Soldier Pill"] = {id = 16476},
	["Shield Soldier Pill"] = {id = 16477},
	["Hebi Shirt"] = {id = 12314},
	["Icy Pants"] = {id = 12300},
	["Blue Leaf"] = {id = 17428},
	["Red Piece of Cloth"] = {id = 12384},
	["Vampire Wing"] = {id = 11189},
	["Yellow Leaf"] = {id = 7426},
	["Blue Sulphurs"] = {id = 12267},
	["Jiraya Shirt"] = {id = 11241},
	["Jiraya ForeHead"] = {id = 3968},
	["Canine Fang"] = {id = 5467},
	["Ghost's Tear"] = {id = 9662},
	["Densetsu"] = {id = 2381},
	["Green Ring"] = {id = 11682},
	["Chouji Armor"] = {id = 8852},
	["Gaara Pants"] = {id = 10495},
	["Anbu Mask"] = {id = 12333},
	["Senbone"] = {id = 2543},
	["Konoha ForeHead"] = {id = 2480},
	["CYan Leaf"] = {id = 17427},
	["Black Anbu Mask"] = {id = 11071},
	["Demon Dust"] = {id = 12381},
	["Blue Ring"] = {id = 11199},
	["White Piece of Cloth"] = {id = 12382},
	["Akatsuki Hat"] = {id = 12328},
	["Akatsuki Tunic"] = {id = 10494},
	["Akatsuki Boots"] = {id = 12313},
	["Bomb Explosive"] = {id = 11452},
	["Akatsuki Fragment"] = {id = 10690},
	["Shuriken Shield"] = {id = 12292},
	["Elite Kunai"] = {id = 12295},
	["Freezing Star"] = {id = 5930},
	["Devil Boots"] = {id = 11162},
	["Red Ring"] = {id = 11198},
	["Blue Piece of Cloth"] = {id = 12385},
	["Demonic Shuriken"] = {id = 2389},
	["Densetsu"] = {id = 2380},
	["Fire Rainbow Shield"] = {id = 12635},
	["Akatsuki shield"] = {id = 11105},
	["Orochimaru Boots"] = {id = 15481},
	["Spectro Sword"] = {id = 11673},
	["Raiton Sword"] = {id = 12255},
	["Vampire Dust"] = {id = 12380},
	["Kunai Staff"] = {id = 12293},
	["Spider Trap"] = {id = 13923},
	["Golden line"] = {id = 17436},
	["Blue Sphere Piece"] = {id = 10558},
	["Demon Flame Essence"] = {id = 14383},
	["Hanzou ForeHead"] = {id = 15783},
	["Red Leaf"] = {id = 17425},
	["Wings of Fire"] = {id = 17438},
	["Hardened Bone"] = {id = 5925},
	["Sniper Gloves"] = {id = 5875},
	["Dressing Kunoichi"] = {id = 10706},
	["Kabutowari"] = {id = 12028},
	["Small Health Potion"] = {id = 10541},
	["Kage Raiton Shuriken"] = {id = 7427},
	["Raikage Glover"] = {id = 12316},
	["Lilac Leaf"] = {id = 17429},
	["Mistic Flame Essence"] = {id = 14382},
	["Leader Anbu Mask"] = {id = 15791},
	["Renegade Pants"] = {id = 15771},
	


    -- Golds
    ["Coin"] = {id = 2148},
    ["Yen"] = {id = 2152},
    ["Jp Iene"] = {id = 2160},
    ["Ryo"] = {id = 18149},
    ["Gold Bar"] = {id = 13893},
    ["Gold Token"] = {id = 18320},
}

-- Receber o opcode vindo do otclient
function onReceiveFirstOpcode(playerId, param)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    if param == "Golds" then
        for i = 1, #optionsAvaiable do
            doSendPlayerExtendedOpcode(playerId, autoloot_send_options_opcodes, optionsAvaiable[i])
        end

        sendAutoLootItems(playerId, param)
    end

    if param == "Items" then
        for i = 1, #optionsAvaiable do
            doSendPlayerExtendedOpcode(playerId, autoloot_send_options_opcodes, optionsAvaiable[i])
        end

        sendAutoLootItems(playerId, param)
        onReceiveItemsAdded(playerId)
    end
    return true
end

-- Enviar a lista de items de autoloot
function sendAutoLootItems(playerId, category)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    local item_list = items[category]
    if not item_list then
        print("[AUTO LOOT ERROR] - The category with name: " .. category .. " not exist in table.")
        return false
    end

    local itemid = item_list.item_id
    local itemname = item_list.item_name
    if #itemid < #itemname then
        print("[AUTO LOOT ERROR] - The size of the list itemid is different of the size list itemname.")
        return false
    end

    if #itemname < #itemid then
        print("[AUTO LOOT ERROR] - The size of the list itemname is different of the size list itemid.")
        return false
    end

    for i = 1, #itemid do
        doSendPlayerExtendedOpcode(playerId, autoloot_send_items_opcode, getItemInfo(itemid[i]).clientId.."@"..itemname[i].."@"..tostring(getAutoLootEnabled(playerId)).."@")
    end
    return true
end

-- Mudar a categoria do auto loot
function onChangeCategory(playerId, category)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    local item_list = items[category]
    if not item_list then
        print("[AUTO LOOT ERROR] - The category with name: " .. category .. " not exist in table.")
        return false
    end

    doSendPlayerExtendedOpcode(playerId, autoloot_send_destroyCHILD_opcode, "destroy".."@")
    
    local itemid = item_list.item_id
    local itemname = item_list.item_name
    if #itemid < #itemname then
        print("[AUTO LOOT ERROR] - The size of the list itemid is different of the size list itemname.")
        return false
    end

    if #itemname < #itemid then
        print("[AUTO LOOT ERROR] - The size of the list itemname is different of the size list itemid.")
        return false
    end

    for i = 1, #itemid do
        doSendPlayerExtendedOpcode(playerId, autoloot_send_items_opcode2, getItemInfo(itemid[i]).clientId.."@"..itemname[i].."@"..tostring(getAutoLootEnabled(playerId)).."@")
    end

    --onReceiveItemsAdded(playerId)
    return true
end

-- Receber os items adicionados pelo jogador
function onReceiveItemsAdded(playerId)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    local tabela = getPlayerAutoLootList(playerId)
    for i = 1, #tabela do
        local table_itemname = items_avaiables[tabela[i]]
        if not table_itemname then
            print("[AUTO LOOT ERROR] - The item with name: " .. tabela[i] .. " not found in table.")
            return false
        end

        local item_id = table_itemname.id -- id do item
        doSendPlayerExtendedOpcode(playerId, autoloot_send_items_added_opcode, getItemInfo(item_id).clientId.."@"..tabela[i].."@")
    end
    return true
end

-- Adicionar o item na lista do auto loot
function onAddItemAutoLootList(playerId, item_name)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    local tabela = getPlayerAutoLootList(playerId)
    if isInArray(tabela, item_name) then
        doPlayerSendTextMessage(playerId, 22, "[AUTO LOOT] - Você já tem o item: " .. item_name .. " na sua lista de auto loot.")
    else
        doPlayerSendTextMessage(playerId, 25, "[AUTO LOOT] - Você adicionou o item: " .. item_name .. " na sua lista de auto loot.")
        doPlayerAddAutoLootItem(playerId, item_name) -- Source Function Add in List
        --onReceiveItemsAdded(playerId) -- send to the client items added (removed !!)

        -- Added (V2.0) - not use the default function of the login: onReceiveItemsAdded
        local table_itemname = items_avaiables[item_name]
        if not table_itemname then
            print("[AUTO LOOT ERROR] - The item with name: " .. item_name .. " not found in table.")
            return false
        end

        local item_id = table_itemname.id -- id do item
        doSendPlayerExtendedOpcode(playerId, autoloot_send_items_added_opcode, getItemInfo(item_id).clientId.."@"..item_name.."@")
    end
    return true
end

-- Remover o item da lista do auto loto
function onRemoveItemAutoLootList(playerId, item_name)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    local tabela = getPlayerAutoLootList(playerId)
    if isInArray(tabela, item_name) then
        doPlayerSendTextMessage(playerId, 25, "[AUTO LOOT] - Você removeu o item: " .. item_name .. " da sua lista de auto loot.")
        doPlayerRemoveAutoLootItem(playerId, item_name) -- Source Function Remove of List

        doSendPlayerExtendedOpcode(playerId, autoloot_send_destroyCHILD_opcode, "destroyAddedItem".."@")
        onReceiveItemsAdded(playerId) -- send to the client items added (removed !!)
    else
        doPlayerSendTextMessage(playerId, 22, "[AUTO LOOT] - Você não tem o item: " .. item_name .. " na sua lista de auto loot.")
    end
    return true
end

-- Mudar o status do auto loot (ligado ou desligado)
function onAutoLootChangeStatus(playerId, status)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return false
    end

    if status == "ligar" then
        doPlayerSendTextMessage(playerId, 25, "[AUTO LOOT] - Você ligou o seu auto loot!")
        doPlayerEnabledAutoLoot(playerId, 1)
    else if status == "desligar" then
        doPlayerSendTextMessage(playerId, 22, "[AUTO LOOT] - Você desligou o seu auto loot!")
        doPlayerEnabledAutoLoot(playerId, 0)
        end
    end
    return true
end

-- Pesquisar item do Auto Loot
function onSearchAutoLootItem(playerId, itemName, category)
    if not isPlayer(playerId) then
        --print("Player não encontrado!")
        return true
    end

    if itemName == "none" then
        onChangeCategory(playerId, category)
        return true
    end

    local tabela = items[category]
    if not tabela then return true end

    for i = 1, #tabela.item_name do
        if string.find(string.lower(tabela.item_name[i]), string.lower(itemName)) then
            doSendPlayerExtendedOpcode(playerId, autoloot_send_items_opcode2, getItemInfo(tabela.item_id[i]).clientId.."@"..tabela.item_name[i].."@"..tostring(getAutoLootEnabled(playerId)).."@")
        end
    end
    return true
end
