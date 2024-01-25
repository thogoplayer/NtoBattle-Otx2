
-- Sistema de SHOP --
SHOP_OPCODE_WINDOW = 156 -- opcode para enviar a janela (mostrar os items)
SHOP_OPCODE_DESTROYINFOS = 157 -- destruir as informacoes antigas da janela
SHOP_OPCODECATEGORY = 158 -- opcode para enviar as opcoes que tem do shop
SHOP_OPCODEUPDATEVALUE = 159 -- atualizar o valor do shop

SHOP_CATEGORIES = {"Vocations", "Skins", "Healthbars", "Wings", "Shaders", "Servicos"} -- aqui sao as categorias
SHOP_ITEMS = {
	-- e abaixo sao as categorias e seus devidos items, voce precisa configurar a imagem aqui e no cliente, pra vir em forma de item, voce coloca style = "item"
	-- pra vir uma outfit direta pro player você usa style = "outfit" e coloca a storage da outfit em outfitStorage, price é o preço do produto e count é a quantidade
	-- entendeu? sim tenta configurar ai pior que nem sei oq colocar agora kkkkkkk
    ["Vocations"] =
    {
        [1] =
        {
            name = "Minato",
			itemId = 11149,
            price = 50,
            count = 1,
            image = 'images/vocations/minato.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
        [2] =
        {
            name = "Hashirama",
			itemId = 11150,
            price = 50,
            count = 1,
            image = 'images/vocations/hashirama.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[3] =
        {
            name = "Madara",
			itemId = 11151,
            price = 50,
            count = 1,
            image = 'images/vocations/madara.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[4] =
        {
            name = "Tobirama",
			itemId = 11205,
            price = 50,
            count = 1,
            image = 'images/vocations/tobirama.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[5] =
        {
            name = "Obito",
			itemId = 11133,
            price = 50,
            count = 1,
            image = 'images/vocations/obito.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[6] =
        {
            name = "Danzou",
			itemId = 11127,
            price = 50,
            count = 1,
            image = 'images/vocations/danzou.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[7] =
        {
            name = "Raikage",
			itemId = 11684,
            price = 50,
            count = 1,
            image = 'images/vocations/raikage.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[8] =
        {
            name = "Shisui",
			itemId = 11672,
            price = 50,
            count = 1,
            image = 'images/vocations/shisui.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[9] =
        {
            name = "Itachi",
			itemId = 14300,
            price = 50,
            count = 1,
            image = 'images/vocations/itachi.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[10] =
        {
            name = "Tsunade",
			itemId = 14301,
            price = 50,
            count = 1,
            image = 'images/vocations/tsunade.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[11] =
        {
            name = "Maito Guy",
			itemId = 14302,
            price = 50,
            count = 1,
            image = 'images/vocations/guy.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[12] =
        {
            name = "Kaguya",
			itemId = 16367,
            price = 50,
            count = 1,
            image = 'images/vocations/kaguya.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[13] =
        {
            name = "Guren",
			itemId = 17813,
            price = 50,
            count = 1,
            image = 'images/vocations/guren.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[14] =
        {
            name = "Hiruzen",
			itemId = 12068,
            price = 50,
            count = 1,
            image = 'images/vocations/hiruzen.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[15] =
        {
            name = "Kisame",
			itemId = 19284,
            price = 50,
            count = 1,
            image = 'images/vocations/kisame.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[16] =
        {
            name = "Sasori",
			itemId = 12070,
            price = 50,
            count = 1,
            image = 'images/vocations/sasori.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[17] =
        {
            name = "Kabuto",
			itemId = 19267,
            price = 50,
            count = 1,
            image = 'images/vocations/kabuto.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[18] =
        {
            name = "Mifune",
			itemId = 19266,
            price = 50,
            count = 1,
            image = 'images/vocations/mifune.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[19] =
        {
            name = "Deidara",
			itemId = 19284,
            price = 35,
            count = 1,
            image = 'images/vocations/deidara.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[20] =
        {
            name = "Gaara",
			itemId = 19274,
            price = 10,
            count = 1,
            image = 'images/vocations/gaara.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[21] =
        {
            name = "Haku",
			itemId = 11128,
            price = 10,
            count = 1,
            image = 'images/vocations/haku.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[22] =
        {
            name = "Hidan",
			itemId = 12072,
            price = 10,
            count = 1,
            image = 'images/vocations/hidan.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[23] =
        {
            name = "Kakuzu",
			itemId = 11703,
            price = 10,
            count = 1,
            image = 'images/vocations/kakuzu.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[24] =
        {
            name = "Nagato",
			itemId = 11704,
            price = 10,
            count = 1,
            image = 'images/vocations/nagato.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[25] =
        {
            name = "Konan",
			itemId = 11708,
            price = 10,
            count = 1,
            image = 'images/vocations/konan.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[26] =
        {
            name = "Orochimaru",
			itemId = 12073,
            price = 10,
            count = 1,
            image = 'images/vocations/orochimaru.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[27] =
        {
            name = "Hinata",
			itemId = 19275,
            price = 10,
            count = 1,
            image = 'images/vocations/hinata.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[28] =
        {
            name = "Ino",
			itemId = 19277,
            price = 10,
            count = 1,
            image = 'images/vocations/ino.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[29] =
        {
            name = "Jiraya",
			itemId = 11685,
            price = 10,
            count = 1,
            image = 'images/vocations/jiraya.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[30] =
        {
            name = "Kakashi",
			itemId = 19278,
            price = 10,
            count = 1,
            image = 'images/vocations/kakashi.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[31] =
        {
            name = "Kankuro",
			itemId = 19279,
            price = 10,
            count = 1,
            image = 'images/vocations/kankuro.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[32] =
        {
            name = "Killer Bee",
			itemId = 19282,
            price = 10,
            count = 1,
            image = 'images/vocations/killerbee.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[33] =
        {
            name = "Naruto",
			itemId = 19288,
            price = 10,
            count = 1,
            image = 'images/vocations/naruto.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[34] =
        {
            name = "Onoki",
			itemId = 19290,
            price = 10,
            count = 1,
            image = 'images/vocations/onoki.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[35] =
        {
            name = "Rock Lee",
			itemId = 19291,
            price = 10,
            count = 1,
            image = 'images/vocations/rocklee.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[36] =
        {
            name = "Sai",
			itemId = 19292,
            price = 10,
            count = 1,
            image = 'images/vocations/sai.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[37] =
        {
            name = "Sakura",
			itemId = 19293,
            price = 10,
            count = 1,
            image = 'images/vocations/sakura.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[38] =
        {
            name = "Sasuke",
			itemId = 19294,
            price = 10,
            count = 1,
            image = 'images/vocations/sasuke.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[39] =
        {
            name = "Shikamaru",
			itemId = 19295,
            price = 10,
            count = 1,
            image = 'images/vocations/shikamaru.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[40] =
        {
            name = "Suigetsu",
			itemId = 19297,
            price = 10,
            count = 1,
            image = 'images/vocations/suigetsu.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[41] =
        {
            name = "Tenten",
			itemId = 19299,
            price = 10,
            count = 1,
            image = 'images/vocations/tenten.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		[42] =
        {
            name = "Neji",
			itemId = 19289,
            price = 10,
            count = 1,
            image = 'images/vocations/neji.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
    },

    ["Skins"] = 
    {
        [1] =
        {
            name = "Naruto Skin",
            price = 25,
            count = 1,
            image = 'images/skins/narutoskin.png',
            outfitStorage = 8000,
            style = "outfit",
			description = "",
        },
        [2] =
        {
            name = "Sasuke Skin",
            price = 25,
            count = 1,
            image = 'images/skins/sasukeskin.png',
            outfitStorage = 8013,
            style = "outfit",
			description = "",
        },
		[3] =
        {
            name = "Itachi Skin",
            price = 25,
            count = 1,
            image = 'images/skins/itachiskin.png',
            outfitStorage = 8002,
            style = "outfit",
			description = "",
        },
		[4] =
        {
            name = "Kakashi Susanoo Skin",
            price = 25,
            count = 1,
            image = 'images/skins/kakashisusanoo.png',
            outfitStorage = 8017,
            style = "outfit",
			description = "",
        },
		[5] =
        {
            name = "Hinata Supreme Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hinatasupreme.png',
            outfitStorage = 8004,
            style = "outfit",
			description = "",
        },
		[6] =
        {
            name = "Hinata Easter Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hinataeaster.png',
            outfitStorage = 8014,
            style = "outfit",
			description = "",
        },
		[7] =
        {
            name = "Hinata Color Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hinatacolor.png',
            outfitStorage = 8019,
            style = "outfit",
			description = "",
        },
		[8] =
        {
            name = "Obito Maskara Skin",
            price = 25,
            count = 1,
            image = 'images/skins/obitomaskara.png',
            outfitStorage = 8015,
            style = "outfit",
			description = "",
        },
		[9] =
        {
            name = "Madara Bleach Skin",
            price = 25,
            count = 1,
            image = 'images/skins/madarableach.png',
            outfitStorage = 8001,
            style = "outfit",
			description = "",
        },
		[10] =
        {
            name = "Madara Old Skin",
            price = 25,
            count = 1,
            image = 'images/skins/madaraold.png',
            outfitStorage = 8003,
            style = "outfit",
			description = "",
        },
		[11] =
        {
            name = "Madara Color Skin",
            price = 25,
            count = 1,
            image = 'images/skins/madaracolor.png',
            outfitStorage = 8001,
            style = "outfit",
			description = "",
        },
		[12] =
        {
            name = "Shisui Shinobi Skin",
            price = 25,
            count = 1,
            image = 'images/skins/shisuishinobi.png',
            outfitStorage = 90000,
            style = "outfit",
			description = "",
        },
		[13] =
        {
            name = "Hashirama Naruto Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hashiramanaruto.png',
            outfitStorage = 90001,
            style = "outfit",
			description = "",
        },
		[14] =
        {
            name = "Guren Skin",
            price = 25,
            count = 1,
            image = 'images/skins/gurenskin.png',
            outfitStorage = 90003,
            style = "outfit",
			description = "",
        },
		[15] =
        {
            name = "Gaara Chibi Skin",
            price = 25,
            count = 1,
            image = 'images/skins/gaarachibi.png',
            outfitStorage = 8007,
            style = "outfit",
			description = "",
        },
		[16] =
        {
            name = "Gaara Shukaku Skin",
            price = 25,
            count = 1,
            image = 'images/skins/gaarashukaku.png',
            outfitStorage = 8020,
            style = "outfit",
			description = "",
        },
		[17] =
        {
            name = "Ino Summer Skin",
            price = 25,
            count = 1,
            image = 'images/skins/inosummer.png',
            outfitStorage = 8018,
            style = "outfit",
			description = "",
        },
		[18] =
        {
            name = "Hidan Color Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hidancolor.png',
            outfitStorage = 8011,
            style = "outfit",
			description = "",
        },
		[19] =
        {
            name = "Wheelchair Guy Skin",
            price = 25,
            count = 1,
            image = 'images/skins/whellchairguy.png',
            outfitStorage = 8005,
            style = "outfit",
			description = "",
        },
		[20] =
        {
            name = "Kuchyose Guy Skin",
            price = 25,
            count = 1,
            image = 'images/skins/kuchyoseguy.png',
            outfitStorage = 8011,
            style = "outfit",
			description = "",
        },
		[21] =
        {
            name = "Capitain Raikage Skin",
            price = 25,
            count = 1,
            image = 'images/skins/capitainraikage.png',
            outfitStorage = 8010,
            style = "outfit",
			description = "",
        },
		[22] =
        {
            name = "Warrior Sakura Skin",
            price = 25,
            count = 1,
            image = 'images/skins/warriorsakura.png',
            outfitStorage = 8008,
            style = "outfit",
			description = "",
        },
		[23] =
        {
            name = "Tenten Shuriken Skin",
            price = 25,
            count = 1,
            image = 'images/skins/tentenshuriken.png',
            outfitStorage = 8029,
            style = "outfit",
			description = "",
        },
		[24] =
        {
            name = "Ultimate Konan Skin",
            price = 25,
            count = 1,
            image = 'images/skins/ultimatekonan.png',
            outfitStorage = 90002,
            style = "outfit",
			description = "",
        },
		[25] =
        {
            name = "Hiruzen Seal Skin",
            price = 25,
            count = 1,
            image = 'images/skins/hiruzenseal.png',
            outfitStorage = 8012,
            style = "outfit",
			description = "",
        },
		[26] =
        {
            name = "Utakata Bubble Skin",
            price = 25,
            count = 1,
            image = 'images/skins/utakatabubble.png',
            outfitStorage = 8012,
            style = "outfit",
			description = "",
        },
		[27] =
        {
            name = "Minato Ace Skin",
            price = 25,
            count = 1,
            image = 'images/skins/minatoace.png',
            outfitStorage = 90004,
            style = "outfit",
			description = "",
        },
		[28] =
        {
            name = "Shisui Bleach Skin",
            price = 25,
            count = 1,
            image = 'images/skins/shisuibleach.png',
            outfitStorage = 90005,
            style = "outfit",
			description = "",
        },
		[29] =
        {
            name = "Obito Death Skin",
            price = 25,
            count = 1,
            image = 'images/skins/obitodeath.png',
            outfitStorage = 90006,
            style = "outfit",
			description = "",
        },
		[30] =
        {
            name = "Warrior Madara Skin",
            price = 25,
            count = 1,
            image = 'images/skins/warriormadara.png',
            outfitStorage = 90007,
            style = "outfit",
			description = "",
        },
		[31] =
        {
            name = "Allmight Raikage Skin",
            price = 25,
            count = 1,
            image = 'images/skins/allmightraikage.png',
            outfitStorage = 90008,
            style = "outfit",
			description = "",
        },
		[32] =
        {
            name = "Tsunade Maravilha Skin",
            price = 25,
            count = 1,
            image = 'images/skins/tsunademaravilha.png',
            outfitStorage = 90009,
            style = "outfit",
			description = "",
        },
    },
    
    ["Healthbars"] =
    {
        [1] =
        {
            name = "Bow Bar",
			itemId = 6540,
            price = 15,
            count = 1,
            image = 'images/healthbar/bow.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
        [2] =
        {
            name = "Dark Bar",
			itemId = 6539,
            price = 20,
            count = 1,
            image = 'images/healthbar/dark.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [3] =
        {
            name = "Fire Bar",
			itemId = 6541,
            price = 20,
            count = 1,
            image = 'images/healthbar/fire.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [4] =
        {
            name = "Ghost Bar",
			itemId = 6542,
            price = 20,
            count = 1,
            image = 'images/healthbar/ghost.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [5] =
        {
            name = "Rainbow Bar",
			itemId = 6543,
            price = 20,
            count = 1,
            image = 'images/healthbar/rainbow.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [6] =
        {
            name = "Party Bar",
			itemId = 19363,
            price = 20,
            count = 1,
            image = 'images/healthbar/party.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [7] =
        {
            name = "Darkness Bar",
			itemId = 19367,
            price = 25,
            count = 1,
            image = 'images/healthbar/darkness.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [8] =
        {
            name = "Chidori Bar",
			itemId = 19371,
            price = 25,
            count = 1,
            image = 'images/healthbar/chidori.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [9] =
        {
            name = "Kurama Bar",
			itemId = 19370,
            price = 30,
            count = 1,
            image = 'images/healthbar/kurama.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [10] =
        {
            name = "Rikudou One Bar",
			itemId = 19368,
            price = 30,
            count = 1,
            image = 'images/healthbar/rikudouone.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
		 [11] =
        {
            name = "Rikudou Two Bar",
			itemId = 19369,
            price = 30,
            count = 1,
            image = 'images/healthbar/rikudoutwo.png',
            outfitStorage = 0,
            style = "item",
			description = "",
        },
    },

    ["Wings"] =
    {
        [1] =
        {
            name = "Wings Special",
            itemId = 19362,
            price = 45,
            count = 1,
            image = 'images/wings/wingsspecial.png',
            style = "item",
			description = "",
        },
    },

    ["Shaders"] =
    {
        [1] =
        {
            name = "Stone of Heat",
            itemId = 19365,
            price = 10,
            count = 1,
            image = 'images/shaders/heat.png',
            style = "item",
			description = "",
        },

        [2] =
        {
            name = "Stone of Party",
            itemId = 19364,
            price = 30,
            count = 1,
            image = 'images/shaders/party.png',
            style = "item",
			description = "",
        },

        [3] =
        {
            name = "Stone of Rainbow",
            itemId = 19366,
            price = 30,
            count = 1,
            image = 'images/shaders/rainbow.png',
            style = "item",
			description = "",
        },
    },

    ["Servicos"] =
    {
        [1] =
        {
            name = "Troca de Nome",
            price = 25,
            itemId = 0,
            count = 1,
            image = 'images/services/name.png',
            style = "service",
			description = "Change character name.",
        },
        [2] =
        {
            name = "1 Day Premium",
			itemId = 10321,
            price = 1,
            count = 1,
            image = 'images/services/1day.png',
            outfitStorage = 0,
            style = "item",
			description = "Um dia de Premium.",
        },
		[3] =
        {
            name = "7 Days Premium",
			itemId = 10322,
            price = 7,
            count = 1,
            image = 'images/services/7days.png',
            outfitStorage = 0,
            style = "item",
			description = "Sete dias de Premium.",
        },
		[4] =
        {
            name = "30 Days Premium",
			itemId = 10323,
            price = 20,
            count = 1,
            image = 'images/services/30days.png',
            outfitStorage = 0,
            style = "item",
			description = "Trinta dias de Premium.",
        },
		[5] =
        {
            name = "Enchantament Crystal",
			itemId = 5921,
            price = 8,
            count = 1,
            image = 'images/services/enchantamentcrystal.png',
            outfitStorage = 0,
            style = "item",
			description = "Item utilizado em armas e escudos.",
        },
		[6] =
        {
            name = "Bronze Exp Card",
			itemId = 10682,
            price = 2,
            count = 1,
            image = 'images/services/bronzecard.png',
            outfitStorage = 0,
            style = "item",
			description = "(Use para obter 20% a mais de Experiencia por 1 hora.)",
        },
		[7] =
        {
            name = "Silver Exp Card",
			itemId = 10683,
            price = 4,
            count = 1,
            image = 'images/services/silvercard.png',
            outfitStorage = 0,
            style = "item",
			description = "(Use para obter 40% a mais de Experiencia por 1 hora.)",
        },
		[8] =
        {
            name = "Golden Exp Card",
			itemId = 10684,
            price = 6,
            count = 1,
            image = 'images/services/goldencard.png',
            outfitStorage = 0,
            style = "item",
			description = "(Use para obter 60% a mais de Experiencia por 1 hora.)",
        },
		[9] =
        {
            name = "Diamond Exp Card",
			itemId = 10685,
            price = 8,
            count = 1,
            image = 'images/services/diamondcard.png',
            outfitStorage = 0,
            style = "item",
			description = "(Use para obter 80% a mais de Experiencia por 1 hora.)",
        },
		[10] =
        {
            name = "Divine Health Potion's",
			itemId = 14258,
            price = 4,
            count = 100,
            image = 'images/services/divinepot.png',
            outfitStorage = 0,
            style = "item",
			description = "Potion superior ao Great Potion(somente nivel 450+ pode usar).",
        },
		[11] =
        {
            name = "Demonic Chakra Potion's",
			itemId = 14259,
            price = 4,
            count = 100,
            image = 'images/services/demonicpot.png',
            outfitStorage = 0,
            style = "item",
			description = "Potion superior ao Great Potion(somente nivel 450+ pode usar).",
        },
		[12] =
        {
            name = "Fundador Necklace",
			itemId = 18907,
            price = 30,
            count = 1,
            image = 'images/services/fundadornecklace.png',
            outfitStorage = 0,
            style = "item",
			description = "Dist/Sword/Glov +15 [HP+25%].",
        },
		[13] =
        {
            name = "Fundador Helm",
			itemId = 11197,
            price = 40,
            count = 1,
            image = 'images/services/fundadorhelm.png',
            outfitStorage = 0,
            style = "item",
			description = "Health +1750/s [Chakra+5200]",
        },
		[14] =
        {
            name = "Fundador Tunic",
			itemId = 11201,
            price = 40,
            count = 1,
            image = 'images/services/fundadortunic.png',
            outfitStorage = 0,
            style = "item",
			description = "(Arm:30, glove ability +10, sword ability +10, distance ability +10). Chakra +1800/s Health +2050/s.",
        },
		[15] =
        {
            name = "Fundador Legs",
			itemId = 17137,
            price = 40,
            count = 1,
            image = 'images/services/fundadorlegs.png',
            outfitStorage = 0,
            style = "item",
			description = "(ninjutsu +6, faster regeneration). Health +1700/s Chakra +1600/s.",
        },
		[16] =
        {
            name = "Fundador Shield",
			itemId = 11082,
            price = 40,
            count = 1,
            image = 'images/services/fundadorshield.png',
            outfitStorage = 0,
            style = "item",
			description = "(Def:3000).",
        },
		[17] =
        {
            name = "Fundador Boots",
			itemId = 14388,
            price = 50,
            count = 1,
            image = 'images/services/fundadorboots.png',
            outfitStorage = 0,
            style = "item",
			description = "(speed +375). -Add [MP+20500 Hp+20500]",
        },
		[18] =
        {
            name = "Fundador Shuriken",
			itemId = 10428,
            price = 45,
            count = 1,
            image = 'images/services/fundadorshuriken.png',
            outfitStorage = 0,
            style = "item",
			description = "(Atk:2650, distance ability +10)",
        },
		[19] =
        {
            name = "Fundador Glover",
			itemId = 10043,
            price = 45,
            count = 1,
            image = 'images/services/fundadorglover.png',
            outfitStorage = 0,
            style = "item",
			description = "(Atk:2600, glove ability +10).",
        },
		[20] =
        {
            name = "Fundador Blade",
			itemId = 11212,
            price = 45,
            count = 1,
            image = 'images/services/fundadorblade.png',
            outfitStorage = 0,
            style = "item",
			description = "(Atk:2650, sword ability +10).",
        },
		[21] =
        {
            name = "Camouflage Backpack",
			itemId = 17457,
            price = 35,
            count = 1,
            image = 'images/services/camouflagebp.png',
            outfitStorage = 0,
            style = "item",
			description = "Chakra+1850/3,5s.",
        },
		[22] =
        {
            name = "Love Backpack",
			itemId = 18558,
            price = 35,
            count = 1,
            image = 'images/services/lovebp.png',
            outfitStorage = 0,
            style = "item",
			description = "Health+1850/2,5s.",
        },
		[23] =
        {
            name = "Bluish Backpack",
			itemId = 18559,
            price = 35,
            count = 1,
            image = 'images/services/bluishbp.png',
            outfitStorage = 0,
            style = "item",
			description = "Glover Skill +8.",
        },
		[24] =
        {
            name = "Crystal Backpack",
			itemId = 11045,
            price = 35,
            count = 1,
            image = 'images/services/crystalbp.png',
            outfitStorage = 0,
            style = "item",
			description = "Distance Skill +8.",
        },
		[25] =
        {
            name = "Diamond Backpack",
			itemId = 17454,
            price = 35,
            count = 1,
            image = 'images/services/diamondbp.png',
            outfitStorage = 0,
            style = "item",
			description = "Sword Skill +8.",
        },
		[26] =
        {
            name = "Golden Ticket",
			itemId = 18487,
            price = 8,
            count = 1,
            image = 'images/services/goldenticket.png',
            outfitStorage = 0,
            style = "item",
			description = "Este item e ultilizado para a roleta de items localizado na area de cassino[2 giros].",
        },
    },
}

function getPlayerPointsZNote(cid)
	if not isPlayer(cid) then
		return 0
	end
	
	local points = 0
	local sl_pts = db.getResult("SELECT `points` FROM `znote_accounts` WHERE `account_id` = '" .. getPlayerAccountId(cid) .. "';")
	if sl_pts:getID() ~= -1 then
		points = sl_pts:getDataInt("points")
	end
	return points
end

function doPlayerRemovePointsZNote(cid, value)
	if not isPlayer(cid) then
		return true
	end
	
	local points_new = getPlayerPointsZNote(cid) - value
	db.executeQuery("UPDATE `znote_accounts` SET `points` = "..points_new.." WHERE `account_id` = " .. getPlayerAccountId(cid) .. ";")
	return true
end

function doPlayerAddPointsZNote(cid, value)
	if not isPlayer(cid) then
		return true
	end
	
	local points_new = getPlayerPointsZNote(cid) + value
	db.executeQuery("UPDATE `znote_accounts` SET `points` = "..points_new.." WHERE `account_id` = " .. getPlayerAccountId(cid) .. ";")
	return true
end

function sendShopWindow(cid, category)
    if not isPlayer(cid) then
        return true
    end

    local tabela = SHOP_ITEMS[category]
    if not tabela then print("Categoria: " .. category .. " nao existe.") return true end

    doSendPlayerExtendedOpcode(cid, SHOP_OPCODE_DESTROYINFOS, "destroyProducts".."@")
    doSendPlayerExtendedOpcode(cid, SHOP_OPCODE_DESTROYINFOS, "destroyCategories".."@")

    for i = 1, #SHOP_CATEGORIES do
        doSendPlayerExtendedOpcode(cid, SHOP_OPCODECATEGORY, SHOP_CATEGORIES[i].."@")
    end

    for i = 1, #tabela do
        doSendPlayerExtendedOpcode(cid, SHOP_OPCODE_WINDOW, tabela[i].name.."@"..tabela[i].image.."@"..tabela[i].price.."@"..tabela[i].count.."@"..i.."@"..category.."@"..getPlayerPointsZNote(cid).."@"..tabela[i].description.."@")
    end
    return true
end

function sendBuyProduct(cid, category, index)
    if not isPlayer(cid) then
        return true
    end

    local tabela = SHOP_ITEMS[category]
    if not tabela then print("Categoria: " .. category .. " nao existe.") return true end

    tabela = tabela[index]
    if not tabela then print("Index: " .. index .. " nao encontrado.") return true end

    if getPlayerPointsZNote(cid) < tabela.price then
        doPlayerPopupFYI(cid, "Você não possui dinheiro suficiente para essa transação.")
        return true
    end

    if tabela.style == "item" then
        doPlayerSendTextMessage(cid, 25, "Sucesso!")

        for i = 1, tabela.count do
            doPlayerAddItem(cid, tabela.itemId, tabela.count)
        end
		
		doPlayerRemovePointsZNote(cid, tabela.price)
		doSendPlayerExtendedOpcode(cid, SHOP_OPCODEUPDATEVALUE, getPlayerPointsZNote(cid).."@")
    elseif tabela.style == "outfit" then
        doPlayerSendTextMessage(cid, 25, "Você desbloqueou uma outfit.")
        setPlayerStorageValue(cid, tabela.outfitStorage, 1)
		
		doPlayerRemovePointsZNote(cid, tabela.price)
		doSendPlayerExtendedOpcode(cid, SHOP_OPCODEUPDATEVALUE, getPlayerPointsZNote(cid).."@")
    elseif tabela.style == "service" then
        if tabela.name == "Troca de Sexo" then
            doPlayerSendTextMessage(cid, 25, "Você trocou de sexo.")
            if getPlayerSex(cid) == 1 then
                doPlayerSetSex(cid, 0)
            else
                doPlayerSetSex(cid, 1)
            end
        end

        if tabela.name == "Troca de Nome" then
            doPlayerSendTextMessage(cid, 25, "Sucesso! Digite: !changename NOME DESEJADO para trocar o nome.")
            setPlayerStorageValue(cid, 9492, 1) -- ganhar storage que pode trocar de nome
        end
		
		doPlayerRemovePointsZNote(cid, tabela.price)
		doSendPlayerExtendedOpcode(cid, SHOP_OPCODEUPDATEVALUE, getPlayerPointsZNote(cid).."@")
    elseif tabela.style == "pokemon" then
        local item = doPlayerAddItem(cid, 11826, 1)
        doItemSetAttribute(item, "poke", tabela.name)
        doItemSetAttribute(item, "boost", tabela.boost)
        doItemSetAttribute(item, "level", tabela.level)
		
		doPlayerRemovePointsZNote(cid, tabela.price)
		doSendPlayerExtendedOpcode(cid, SHOP_OPCODEUPDATEVALUE, getPlayerPointsZNote(cid).."@")
    end

    return true
end