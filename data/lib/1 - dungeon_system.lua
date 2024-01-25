DUNGEON_OPCODE_DESTROYINFO = 87 -- opcode que vai destruir as informacoes anteriores
DUNGEON_OPCODE_LEVEL = 88 -- opcode que vai enviar: leveis
DUNGEON_OPCODE_DIFFICULTY = 89 -- ocpode que vai enviar: dificuldade
DUNGEON_OPCODE_MISSIONS = 90 -- opcode que vai enviar: missoes disponiveis
DUNGEON_OPCODE_ITEMS = 91 -- opcode que vai enviar: items necessarios para a DG
DUNGEON_OPCODE_INVITE = 92 -- opcode que vai enviar: convite para o player
DUNGEON_OPCODE_PLAYERS_PARTY = 93 -- opcode que vai enviar: players da party.
DUNGEON_OPCODE_PLAYER_TIME_MODULE = 94 -- opcode que vai enviar: module de tempo
DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE = 95 -- opcode que vai enviar: ocultar o module de tempo
DUNGEON_OPCODE_CLOSEWINDOW = 96

DUNGEON_STORAGE_TIME = 92912 -- storage de tempo da storage
DUNGEON_STORAGE_NUMERATION = 92913 -- storage para guardar a numeration da dungeon pra no final ele kickar o player ou teleportar ele
DUNGEON_STORAGE_CATEGORY = 92914 -- storage para guardar a categoria da dungeon pra no final ele kickar o player ou teleportar ele
DUNGEON_STORAGE_KILLEDCREATURES = 92915 -- storage para guardar a quantidade de monstros que voce matou
DUNGEON_STORAGE_COUNTCREATURES_AREA = 92916 -- storage para guardar a quantidade de monstros na area

DUNGEON_LEVELS = {"Easy", "Medium", "Hard", "Expert"}
DUNGEON_DIFFICULTYS = {"Gennin/Chunnin", "Jounnin/Anbu", "E-Jounnin", "Sannin/Kage"}

-- name: vai ficar o nome da dungeon
-- players: quantidade de players da dungeon
-- image: nome da imagem
-- recompense_list: id das recompensas que vao mostrar no module (em forma de nome, claro, o id � apenas para puxar o nome pelo id)
-- count: quantidade das recompensas
-- dungeon_time: tempo em minutos/horas para ficar na DG (em segundos)
-- dungeon_time_miliseconds: tempo em minutos/horas para ficar na DG (em milisegundos), ele precisa estar em MILISEGUNDOS, se nao nao funciona
-- storageGlobal: voce coloca alguma storage qualquer
-- isHour: se for uma dungeon que come�a em X horario voce deixa true, se nao, false
-- tox position = sala de recompensa

DUNGEONS_MISSIONCATEGORY = {
    ["Gennin/Chunnin"] =
    {
        [1] = {name = "Mizuki", players = 1, image = "mizuki_off.png", recompense_list = {18149, 2152}, count = {1, 15}, dungeon_time = 3001, dungeon_time_miliseconds = 3000000, storageGlobal = 8581, isHour = false, items = {19185}, count_req = {1}},
        [2] = {name = "Zabuza", players = 2, image = "zabuza_off.png", recompense_list = {18149, 2152}, count = {5, 11}, dungeon_time = 3001, dungeon_time_miliseconds = 3000000, storageGlobal = 8582, isHour = false, items = {19185}, count_req = {1}},
        [3] = {name = "Chunnin", players = 1, image = "chunnin_off.png", recompense_list = {18149, 2152}, count = {5, 35}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8583, isHour = false, items = {19183}, count_req = {1}},
        [4] = {name = "Kabuto", players = 2, image = "kabuto_off.png", recompense_list = {18149, 2152}, count = {6, 45}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8584, isHour = false, items = {19183}, count_req = {1}},
    },

    ["Jounnin/Anbu"] =
    {
		[1] = {name = "Orochimaru", players = 1, image = "orochimaru_off.png", recompense_list = {18149, 2152}, count = {10, 25}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8587, isHour = false, items = {19183}, count_req = {1}},
        [2] = {name = "Gaara", players = 3, image = "shukaku_off.png", recompense_list = {18149, 2152}, count = {10, 15}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8585, isHour = false, items = {19186}, count_req = {1}},
        [3] = {name = "Sasuke", players = 1, image = "sasuke_off.png", recompense_list = {18149, 2152}, count = {10, 35}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8586, isHour = false, items = {19186}, count_req = {1}},
        [4] = {name = "Sannin", players = 3, image = "Sannin_off.png", recompense_list = {18149, 2152}, count = {15, 25}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8587, isHour = false, items = {19184}, count_req = {1}},
    },

    ["E-Jounnin"] =
    {
        [1] = {name = "Akatsuki(Hidan e Kakuzo)", players = 2, image = "akathk_off.png", recompense_list = {18149, 2152}, count = {25, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8589, isHour = false, items = {19186}, count_req = {1}},
        [2] = {name = "Akatsuki(Deidara e Sasori)", players = 2, image = "akatds_off.png", recompense_list = {18149, 2152}, count = {25, 42}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8591, isHour = false, items = {19186}, count_req = {1}},
        [3] = {name = "Akatsuki(Deidara e Tobi)", players = 2, image = "akatdt_off.png", recompense_list = {18149, 2152}, count = {25, 43}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8592, isHour = false, items = {19186}, count_req = {1}},
		[4] = {name = "Akatsuki(Kisami e Itachi)", players = 2, image = "akatki_off.png", recompense_list = {18149, 2152}, count = {25, 43}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8592, isHour = false, items = {19186}, count_req = {1}},
		[5] = {name = "Akatsuki(Pain e Konan)", players = 2, image = "akatpk_off.png", recompense_list = {18149, 2152}, count = {25, 43}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8592, isHour = false, items = {19186}, count_req = {1}},
    },

    ["Sannin/Kage"] =
    {
        [1] = {name = "Pain", players = 1, image = "pain_off.png", recompense_list = {18149, 2152}, count = {30, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8593, isHour = false, items = {19183}, count_req = {1}},
        [2] = {name = "Itachi", players = 1, image = "itachi_off.png", recompense_list = {18149, 2152}, count = {30, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8594, isHour = false, items = {19183}, count_req = {1}},
        [3] = {name = "Nagato", players = 4, image = "nagato_off.png", recompense_list = {18149, 2152}, count = {45, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8595, isHour = false, items = {19184}, count_req = {1}},
		[4] = {name = "Kabuto", players = 4, image = "kabutog_off.png", recompense_list = {18149, 2152}, count = {70, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8596, isHour = false, items = {19186}, count_req = {1}},
		[5] = {name = "Obito", players = 6, image = "obito_off.png", recompense_list = {18149, 2152}, count = {70, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8596, isHour = false, items = {19184}, count_req = {1}},
        [6] = {name = "Madara", players = 6, image = "madara_off.png", recompense_list = {18149, 2152}, count = {70, 44}, dungeon_time = 2401, dungeon_time_miliseconds = 2400000, storageGlobal = 8596, isHour = true, items = {19184}, count_req = {2}},
    },
}


DUNGEONS_SALAS = {
    ["Gennin/Chunnin"] =
    {
        [1] =
        {
            pos = {
               {x = 1410, y = 1231, z = 5},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1409, y = 1229, z = 6},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 1408, y = 1227, z = 7},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1250, fromy = 1126, fromz = 5, tox = 1448, toy = 1255, toz = 5}, -- checar toda a area da dungeon
                {fromx = 1250, fromy = 1126, fromz = 6, tox = 1448, toy = 1255, toz = 6}, -- checar toda a area da dungeon
                {fromx = 1250, fromy = 1126, fromz = 7, tox = 1448, toy = 1255, toz = 7}, -- checar toda a area da dungeon
            },

            chest_pos = {
                {x = 1472, y = 1092, z = 5},
                {x = 1471, y = 1091, z = 6}, -- posi��o literalmente onde est� o ba�
                {x = 1470, y = 1090, z = 7},
            },

            arenaDungeon_pos = { 
                {fromx = 1250, fromy = 1126, fromz = 5, tox = 1448, toy = 1255, toz = 5}, -- Checar quantos monstros tem na area
                {fromx = 1250, fromy = 1126, fromz = 6, tox = 1448, toy = 1255, toz = 6}, -- Checar quantos monstros tem na area
                {fromx = 1250, fromy = 1126, fromz = 7, tox = 1448, toy = 1255, toz = 7}, -- Checar quantos monstros tem na area
            },

            checkBauChest = { -- posi��es norte esquerda e sul direita da sala
                {fromx = 1438, fromy = 1078, fromz = 5, tox = 1501, toy = 1132, toz = 5},  -- Checar se o jogador est� na sala
                {fromx = 1438, fromy = 1078, fromz = 6, tox = 1501, toy = 1132, toz = 6},
                {fromx = 1438, fromy = 1078, fromz = 7, tox = 1501, toy = 1132, toz = 7},  
                
            },

            reward_position = { -- centro da sala
                -- posi��o da sala do ba�
                {x = 1472, y = 1092, z = 5},
                {x = 1471, y = 1091, z = 6},
                {x = 1470, y = 1090, z = 7},
            },

            monstersList = {
                {
                -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Bunshin Mizuki", {x = 1388, y = 1221, z = 5}},
                    {"Bunshin Mizuki", {x = 1382, y = 1217, z = 5}},
                    {"Bunshin Mizuki", {x = 1378, y = 1223, z = 5}},
                    {"Bunshin Mizuki", {x = 1369, y = 1207, z = 5}},
                    {"Bunshin Mizuki", {x = 1360, y = 1218, z = 5}},
                    {"Bunshin Mizuki", {x = 1366, y = 1226, z = 5}},
                    {"Bunshin Mizuki", {x = 1354, y = 1221, z = 5}},
  					{"Bunshin Mizuki", {x = 1342, y = 1219, z = 5}},
					{"Bunshin Mizuki", {x = 1334, y = 1223, z = 5}},
					{"Bunshin Mizuki", {x = 1322, y = 1224, z = 5}},
					{"Bunshin Mizuki", {x = 1308, y = 1225, z = 5}},
					{"Bunshin Mizuki", {x = 1312, y = 1214, z = 5}},
					{"Bunshin Mizuki", {x = 1305, y = 1202, z = 5}},
					{"Bunshin Mizuki", {x = 1310, y = 1190, z = 5}},
					{"Bunshin Mizuki", {x = 1328, y = 1190, z = 5}},
					{"Bunshin Mizuki", {x = 1346, y = 1193, z = 5}},
					{"Bunshin Mizuki", {x = 1358, y = 1191, z = 5}},
					{"Bunshin Mizuki", {x = 1370, y = 1192, z = 5}},
					{"Bunshin Mizuki", {x = 1383, y = 1198, z = 5}},
					{"Bunshin Mizuki", {x = 1405, y = 1209, z = 5}},
					{"Bunshin Mizuki", {x = 1407, y = 1188, z = 5}},
					{"Bunshin Mizuki", {x = 1384, y = 1182, z = 5}},
					{"Bunshin Mizuki", {x = 1350, y = 1179, z = 5}},
					{"Bunshin Mizuki", {x = 1317, y = 1177, z = 5}},
					{"Bunshin Mizuki", {x = 1303, y = 1169, z = 5}},
					{"Bunshin Mizuki", {x = 1291, y = 1173, z = 5}},
					{"Bunshin Mizuki", {x = 1303, y = 1158, z = 5}},
					{"Bunshin Mizuki", {x = 1292, y = 1156, z = 5}},
					{"Bunshin Mizuki", {x = 1331, y = 1159, z = 5}},
					{"Bunshin Mizuki", {x = 1360, y = 1161, z = 5}},
                },

                {
                    -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Bunshin Mizuki", {x = 1388, y = 1221, z = 6}},
                    {"Bunshin Mizuki", {x = 1382, y = 1217, z = 6}},
                    {"Bunshin Mizuki", {x = 1378, y = 1223, z = 6}},
                    {"Bunshin Mizuki", {x = 1369, y = 1207, z = 6}},
                    {"Bunshin Mizuki", {x = 1360, y = 1218, z = 6}},
                    {"Bunshin Mizuki", {x = 1366, y = 1226, z = 6}},
                    {"Bunshin Mizuki", {x = 1354, y = 1221, z = 6}},
  					{"Bunshin Mizuki", {x = 1342, y = 1219, z = 6}},
					{"Bunshin Mizuki", {x = 1334, y = 1223, z = 6}},
					{"Bunshin Mizuki", {x = 1322, y = 1224, z = 6}},
					{"Bunshin Mizuki", {x = 1308, y = 1225, z = 6}},
					{"Bunshin Mizuki", {x = 1312, y = 1214, z = 6}},
					{"Bunshin Mizuki", {x = 1305, y = 1202, z = 6}},
					{"Bunshin Mizuki", {x = 1310, y = 1190, z = 6}},
					{"Bunshin Mizuki", {x = 1328, y = 1190, z = 6}},
					{"Bunshin Mizuki", {x = 1346, y = 1193, z = 6}},
					{"Bunshin Mizuki", {x = 1358, y = 1191, z = 6}},
					{"Bunshin Mizuki", {x = 1370, y = 1192, z = 6}},
					{"Bunshin Mizuki", {x = 1383, y = 1198, z = 6}},
					{"Bunshin Mizuki", {x = 1405, y = 1209, z = 6}},
					{"Bunshin Mizuki", {x = 1407, y = 1188, z = 6}},
					{"Bunshin Mizuki", {x = 1384, y = 1182, z = 6}},
					{"Bunshin Mizuki", {x = 1350, y = 1179, z = 6}},
					{"Bunshin Mizuki", {x = 1317, y = 1177, z = 6}},
					{"Bunshin Mizuki", {x = 1303, y = 1169, z = 6}},
					{"Bunshin Mizuki", {x = 1291, y = 1173, z = 6}},
					{"Bunshin Mizuki", {x = 1303, y = 1158, z = 6}},
					{"Bunshin Mizuki", {x = 1292, y = 1156, z = 6}},
					{"Bunshin Mizuki", {x = 1331, y = 1159, z = 6}},
					{"Bunshin Mizuki", {x = 1360, y = 1161, z = 6}},
                },

                {
                    -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Bunshin Mizuki", {x = 1388, y = 1221, z = 7}},
                    {"Bunshin Mizuki", {x = 1382, y = 1217, z = 7}},
                    {"Bunshin Mizuki", {x = 1378, y = 1223, z = 7}},
                    {"Bunshin Mizuki", {x = 1369, y = 1207, z = 7}},
                    {"Bunshin Mizuki", {x = 1360, y = 1218, z = 7}},
                    {"Bunshin Mizuki", {x = 1366, y = 1226, z = 7}},
                    {"Bunshin Mizuki", {x = 1354, y = 1221, z = 7}},
  					{"Bunshin Mizuki", {x = 1342, y = 1219, z = 7}},
					{"Bunshin Mizuki", {x = 1334, y = 1223, z = 7}},
					{"Bunshin Mizuki", {x = 1322, y = 1224, z = 7}},
					{"Bunshin Mizuki", {x = 1308, y = 1225, z = 7}},
					{"Bunshin Mizuki", {x = 1312, y = 1214, z = 7}},
					{"Bunshin Mizuki", {x = 1305, y = 1202, z = 7}},
					{"Bunshin Mizuki", {x = 1310, y = 1190, z = 7}},
					{"Bunshin Mizuki", {x = 1328, y = 1190, z = 7}},
					{"Bunshin Mizuki", {x = 1346, y = 1193, z = 7}},
					{"Bunshin Mizuki", {x = 1358, y = 1191, z = 7}},
					{"Bunshin Mizuki", {x = 1370, y = 1192, z = 7}},
					{"Bunshin Mizuki", {x = 1383, y = 1198, z = 7}},
					{"Bunshin Mizuki", {x = 1405, y = 1209, z = 7}},
					{"Bunshin Mizuki", {x = 1407, y = 1188, z = 7}},
					{"Bunshin Mizuki", {x = 1384, y = 1182, z = 7}},
					{"Bunshin Mizuki", {x = 1350, y = 1179, z = 7}},
					{"Bunshin Mizuki", {x = 1317, y = 1177, z = 7}},
					{"Bunshin Mizuki", {x = 1303, y = 1169, z = 7}},
					{"Bunshin Mizuki", {x = 1291, y = 1173, z = 7}},
					{"Bunshin Mizuki", {x = 1303, y = 1158, z = 7}},
					{"Bunshin Mizuki", {x = 1292, y = 1156, z = 7}},
					{"Bunshin Mizuki", {x = 1331, y = 1159, z = 7}},
					{"Bunshin Mizuki", {x = 1360, y = 1161, z = 7}},
                },   
            },

            bossList = {
                {name = {"[DUNGEON] Mizuki"}, pos = {x = 1393, y = 1162, z = 5}}, -- Posi��o do boss dentro da dungeon
                {name = {"[DUNGEON] Mizuki"}, pos = {x = 1393, y = 1162, z = 6}}, -- Posi��o do boss dentro da dungeon
                {name = {"[DUNGEON] Mizuki"}, pos = {x = 1393, y = 1162, z = 7}}, -- Posi��o do boss dentro da dungeon
            },
        },

        [2] =
        {
            pos = {
                {x = 1665, y = 3680, z = 8},  -- onde o jogador vai teleporta dentro da dungeon sala 1
                {x = 1665, y = 3680, z = 9},  -- onde o jogador vai teleporta dentro da dungeon sala 2
                {x = 1665, y = 3680, z = 10},  -- onde o jogador vai teleporta dentro da dungeon sala 3
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1561, fromy = 3591, fromz = 8, tox = 1766, toy = 3695, toz = 8}, -- checar toda a area da dungeon sala 1
                {fromx = 1561, fromy = 3591, fromz = 9, tox = 1766, toy = 3695, toz = 9}, -- checar toda a area da dungeon sala 2
                {fromx = 1561, fromy = 3591, fromz = 10, tox = 1766, toy = 3695, toz = 10}, -- checar toda a area da dungeon sala 3
            },

            chest_pos = {
                {x = 1667, y = 3735, z = 8}, -- posição onde está o baú sala 1
                {x = 1666, y = 3734, z = 9}, -- posição onde está o baú sala 2
                {x = 1665, y = 3733, z = 10}, -- posição onde está o baú sala 3
            },

            arenaDungeon_pos = { 
                {fromx = 1561, fromy = 3591, fromz = 8, tox = 1766, toy = 3695, toz = 8}, -- Checar quantos monstros tem na area sala 1
                {fromx = 1561, fromy = 3591, fromz = 9, tox = 1766, toy = 3695, toz = 9}, -- Checar quantos monstros tem na area sala 2
                {fromx = 1561, fromy = 3591, fromz = 10, tox = 1766, toy = 3695, toz = 10}, -- Checar quantos monstros tem na area sala 3
            },

            bossDungeon_pos = {
                {fromx = 1561, fromy = 3591, fromz = 8, tox = 1766, toy = 3695, toz = 8},  -- Checar se o boss esta vivo sala 1
                {fromx = 1561, fromy = 3591, fromz = 9, tox = 1766, toy = 3695, toz = 9},  -- Checar se o boss esta vivo sala 2
                {fromx = 1561, fromy = 3591, fromz = 10, tox = 1766, toy = 3695, toz = 10},  -- Checar se o boss esta vivo sala 3
                
            },

            checkBauChest = { -- posição norte esquerda e sul direita da sala da dungeon
                {fromx = 1628, fromy = 3716, fromz = 8, tox = 1711, toy = 3775, toz = 8},  -- checar se o jogador estar na sala 1
                {fromx = 1628, fromy = 3716, fromz = 9, tox = 1711, toy = 3775, toz = 9},  -- checar se o jogador estar na sala 2
                {fromx = 1628, fromy = 3716, fromz = 10, tox = 1711, toy = 3775, toz = 10},  -- checar se o jogador estar na sala 3
                
            },

            reward_position = { -- centro da sala
                {x = 1667, y = 3746, z = 8}, -- posição da sala do baú 1
                {x = 1667, y = 3746, z = 9}, -- posição da sala do baú 2 
                {x = 1667, y = 3746, z = 10}, -- posição da sala do baú 3
            },

            monstersList = {
                {
                -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Bunshin Haku", {x = 1725, y = 3615, z = 8}}, -- sala 1
                    {"Bunshin Haku", {x = 1715, y = 3656, z = 8}}, -- sala 1
                    {"Bunshin Haku", {x = 1654, y = 3688, z = 8}}, -- sala 1
                    {"Bunshin Haku", {x = 1620, y = 3608, z = 8}}, -- sala 1
                    {"Bunshin Haku", {x = 1580, y = 3624, z = 8}}, -- sala 1
					{"Bunshin Zabuza", {x = 1689, y = 3663, z = 8}}, -- sala 1
					{"Bunshin Zabuza", {x = 1705, y = 3614, z = 8}}, -- sala 1
					{"Bunshin Zabuza", {x = 1618, y = 3663, z = 8}}, -- sala 1
					{"Bunshin Zabuza", {x = 1615, y = 3629, z = 8}}, -- sala 1
					{"Bunshin Zabuza", {x = 1708, y = 3690, z = 8}}, -- sala 1
					{"[DUNGEON] Haku", {x = 1654, y = 3631, z = 8}}, -- sala 1
					{"[DUNGEON] Zabuza", {x = 1674, y = 3631, z = 8}}, -- sala 1
                },

                {
                    -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Bunshin Haku", {x = 1725, y = 3616, z = 9}}, -- sala 1
                    {"Bunshin Haku", {x = 1715, y = 3657, z = 9}}, -- sala 1
                    {"Bunshin Haku", {x = 1654, y = 3688, z = 9}}, -- sala 1
                    {"Bunshin Haku", {x = 1620, y = 3608, z = 9}}, -- sala 1
                    {"Bunshin Haku", {x = 1580, y = 3624, z = 9}}, -- sala 1
					{"Bunshin Zabuza", {x = 1689, y = 3663, z = 9}}, -- sala 1
					{"Bunshin Zabuza", {x = 1705, y = 3615, z = 9}}, -- sala 1
					{"Bunshin Zabuza", {x = 1618, y = 3663, z = 9}}, -- sala 1
					{"Bunshin Zabuza", {x = 1615, y = 3629, z = 9}}, -- sala 1
					{"Bunshin Zabuza", {x = 1708, y = 3689, z = 9}}, -- sala 1
					{"[DUNGEON] Haku", {x = 1654, y = 3629, z = 9}}, -- sala 1
					{"[DUNGEON] Zabuza", {x = 1674, y = 3629, z = 9}}, -- sala 1
                },

                {
                    -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Bunshin Haku", {x = 1725, y = 3616, z = 10}}, -- sala 1
                    {"Bunshin Haku", {x = 1715, y = 3656, z = 10}}, -- sala 1
                    {"Bunshin Haku", {x = 1654, y = 3688, z = 10}}, -- sala 1
                    {"Bunshin Haku", {x = 1620, y = 3608, z = 10}}, -- sala 1
                    {"Bunshin Haku", {x = 1580, y = 3624, z = 10}}, -- sala 1
					{"Bunshin Zabuza", {x = 1689, y = 3663, z = 10}}, -- sala 1
					{"Bunshin Zabuza", {x = 1705, y = 3614, z = 10}}, -- sala 1
					{"Bunshin Zabuza", {x = 1618, y = 3663, z = 10}}, -- sala 1
					{"Bunshin Zabuza", {x = 1615, y = 3629, z = 10}}, -- sala 1
					{"Bunshin Zabuza", {x = 1706, y = 3688, z = 10}}, -- sala 1
					{"[DUNGEON] Haku", {x = 1654, y = 3629, z = 10}}, -- sala 1
					{"[DUNGEON] Zabuza", {x = 1674, y = 3629, z = 10}}, -- sala 1
                },   
            },

            bossList = {
                {name = {"Zabuza Enfraquecido"}, pos = {x = 1663, y = 3630, z = 8}}, -- posição do boss dentro da dungeon sala 1
                {name = {"Zabuza Enfraquecido"}, pos = {x = 1663, y = 3630, z = 9}}, -- posição do boss dentro da dungeon sala 2
                {name = {"Zabuza Enfraquecido"}, pos = {x = 1663, y = 3630, z = 10}}, -- posição do boss dentro da dungeon sala 3
            },
        }, 
		
		[3] =
        {
            pos = {
                {x = 1675, y = 3623, z = 5},  -- onde o jogador vai teleporta dentro da dungeon sala 1
                {x = 1675, y = 3623, z = 6},  -- onde o jogador vai teleporta dentro da dungeon sala 2
                {x = 1675, y = 3623, z = 7},  -- onde o jogador vai teleporta dentro da dungeon sala 3
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1621, fromy = 3581, fromz = 5, tox = 1737, toy = 3661, toz = 5}, -- checar toda a area da dungeon sala 1
                {fromx = 1621, fromy = 3581, fromz = 6, tox = 1737, toy = 3661, toz = 6}, -- checar toda a area da dungeon sala 2
                {fromx = 1621, fromy = 3581, fromz = 7, tox = 1737, toy = 3661, toz = 7}, -- checar toda a area da dungeon sala 3
            },

            chest_pos = {
                {x = 1696, y = 3695, z = 5}, -- posição onde está o baú sala 1
                {x = 1695, y = 3694, z = 6}, -- posição onde está o baú sala 2
                {x = 1694, y = 3694, z = 7}, -- posição onde está o baú sala 3
            },

            arenaDungeon_pos = { 
                {fromx = 1621, fromy = 3581, fromz = 5, tox = 1737, toy = 3661, toz = 5}, -- Checar quantos monstros tem na area sala 1
                {fromx = 1621, fromy = 3581, fromz = 6, tox = 1737, toy = 3661, toz = 6}, -- Checar quantos monstros tem na area sala 2
                {fromx = 1621, fromy = 3581, fromz = 7, tox = 1737, toy = 3661, toz = 7}, -- Checar quantos monstros tem na area sala 3
            },

            bossDungeon_pos = {
                {fromx = 1621, fromy = 3581, fromz = 5, tox = 1737, toy = 3661, toz = 5},  -- Checar se o boss esta vivo sala 1
                {fromx = 1621, fromy = 3581, fromz = 6, tox = 1737, toy = 3661, toz = 6},  -- Checar se o boss esta vivo sala 2
                {fromx = 1621, fromy = 3581, fromz = 7, tox = 1737, toy = 3661, toz = 7},  -- Checar se o boss esta vivo sala 3
                
            },

            checkBauChest = { -- posição norte esquerda e sul direita da sala da dungeon
                {fromx = 1647, fromy = 3679, fromz = 5, tox = 1738, toy = 3730, toz = 5},  -- checar se o jogador estar na sala 1
                {fromx = 1647, fromy = 3679, fromz = 6, tox = 1738, toy = 3730, toz = 6},  -- checar se o jogador estar na sala 2
                {fromx = 1647, fromy = 3679, fromz = 7, tox = 1738, toy = 3730, toz = 7},  -- checar se o jogador estar na sala 3
                
            },

            reward_position = { -- centro da sala
                {x = 1696, y = 3700, z = 5}, -- posição da sala do baú 1
                {x = 1696, y = 3700, z = 6}, -- posição da sala do baú 2 
                {x = 1696, y = 3700, z = 7}, -- posição da sala do baú 3
            },

            monstersList = {
                {
                -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Sasuke Gennin", {x = 1659, y = 3617, z = 5}}, -- sala 1
                    {"Shino Gennin", {x = 1658, y = 3621, z = 5}}, -- sala 1
                    {"Kankuro Gennin", {x = 1660, y = 3623, z = 5}}, -- sala 1
                    {"Sakura Gennin", {x = 1664, y = 3625, z = 5}}, -- sala 1
                    {"Ino Gennin", {x = 1666, y = 3620, z = 5}}, -- sala 1
					{"Temari Gennin", {x = 1681, y = 3618, z = 5}}, -- sala 1
					{"Tenten Gennin", {x = 1681, y = 3622, z = 5}}, -- sala 1
					{"Shikamaru Gennin", {x = 1689, y = 3618, z = 5}}, -- sala 1
					{"Naruto Gennin", {x = 1675, y = 3625, z = 5}}, -- sala 1
					{"Kiba Gennin", {x = 1669, y = 3616, z = 5}}, -- sala 1
					{"Hinata Gennin", {x = 1688, y = 3621, z = 5}}, -- sala 1
					{"Neji Gennin", {x = 1657, y = 3624, z = 5}}, -- sala 1
					{"Rock Lee Gennin", {x = 1688, y = 3625, z = 5}}, -- sala 1
					{"Choji Gennin", {x = 1682, y = 3626, z = 5}}, -- sala 1
					{"Gaara Gennin", {x = 1660, y = 3621, z = 5}}, -- sala 1
                },

                {
                    -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Sasuke Gennin", {x = 1659, y = 3617, z = 6}}, -- sala 1
                    {"Shino Gennin", {x = 1658, y = 3621, z = 6}}, -- sala 1
                    {"Kankuro Gennin", {x = 1660, y = 3623, z = 6}}, -- sala 1
                    {"Sakura Gennin", {x = 1664, y = 3625, z = 6}}, -- sala 1
                    {"Ino Gennin", {x = 1666, y = 3620, z = 6}}, -- sala 1
					{"Temari Gennin", {x = 1681, y = 3618, z = 6}}, -- sala 1
					{"Tenten Gennin", {x = 1681, y = 3622, z = 6}}, -- sala 1
					{"Shikamaru Gennin", {x = 1689, y = 3618, z = 6}}, -- sala 1
					{"Naruto Gennin", {x = 1675, y = 3625, z = 6}}, -- sala 1
					{"Kiba Gennin", {x = 1669, y = 3616, z = 6}}, -- sala 1
					{"Hinata Gennin", {x = 1688, y = 3621, z = 6}}, -- sala 1
					{"Neji Gennin", {x = 1657, y = 3624, z = 6}}, -- sala 1
					{"Rock Lee Gennin", {x = 1688, y = 3625, z = 6}}, -- sala 1
					{"Choji Gennin", {x = 1682, y = 3626, z = 6}}, -- sala 1
					{"Gaara Gennin", {x = 1660, y = 3621, z = 6}}, -- sala 1
                },

                {
                    -- Nome do monstro e a posição de cada monstro dentro da posição da dungeon
                    {"Sasuke Gennin", {x = 1659, y = 3617, z = 7}}, -- sala 1
                    {"Shino Gennin", {x = 1658, y = 3621, z = 7}}, -- sala 1
                    {"Kankuro Gennin", {x = 1660, y = 3623, z = 7}}, -- sala 1
                    {"Sakura Gennin", {x = 1664, y = 3625, z = 7}}, -- sala 1
                    {"Ino Gennin", {x = 1666, y = 3620, z = 7}}, -- sala 1
					{"Temari Gennin", {x = 1681, y = 3618, z = 7}}, -- sala 1
					{"Tenten Gennin", {x = 1681, y = 3622, z = 7}}, -- sala 1
					{"Shikamaru Gennin", {x = 1689, y = 3618, z = 7}}, -- sala 1
					{"Naruto Gennin", {x = 1675, y = 3625, z = 7}}, -- sala 1
					{"Kiba Gennin", {x = 1669, y = 3616, z = 7}}, -- sala 1
					{"Hinata Gennin", {x = 1688, y = 3621, z = 7}}, -- sala 1
					{"Neji Gennin", {x = 1657, y = 3624, z = 7}}, -- sala 1
					{"Rock Lee Gennin", {x = 1688, y = 3625, z = 7}}, -- sala 1
					{"Choji Gennin", {x = 1682, y = 3626, z = 7}}, -- sala 1
					{"Gaara Gennin", {x = 1660, y = 3621, z = 7}}, -- sala 1
                },   
            },

            bossList = {
                {name = {"[DUNGEON] Shikamaru"}, pos = {x = 1674, y = 3620, z = 5}}, -- posição do boss dentro da dungeon sala 1
                {name = {"[DUNGEON] Shikamaru"}, pos = {x = 1674, y = 3620, z = 6}}, -- posição do boss dentro da dungeon sala 2
                {name = {"[DUNGEON] Shikamaru"}, pos = {x = 1674, y = 3620, z = 7}}, -- posição do boss dentro da dungeon sala 3
            },
        }, 

    },

    ["Jounnin/Anbu"] =
    {
        [1] =
        {
            pos = {
               {x = 254, y = 62, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 293, y = 62, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
               {x = 333, y = 61, z = 9},  -- onde o jogador vai teleporta dentro da dungeon
            },

            pos_areas_checkHasPlayer = {
                {fromx = 239, fromy = 49, fromz = 9, tox = 270, toy = 74, toz = 9}, -- checar toda a area da dungeon
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9}, -- checar toda a area da dungeon
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9}, -- checar toda a area da dungeon
            },

            chest_pos = {
                {x = 249, y = 29, z = 9},
                {x = 285, y = 26, z = 9}, -- posi��o literalmente onde est� o ba�
                {x = 336, y = 27, z = 9},
            },

            arenaDungeon_pos = { 
                {fromx = 239, fromy = 49, fromz = 9, tox = 270, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9}, -- Checar quantos monstros tem na area
            },

            bossDungeon_pos = {
                {fromx = 193, fromy = 56, fromz = 9, tox = 206, toy = 69, toz = 9},  -- Checar se o boss esta vivo
                {fromx = 276, fromy = 50, fromz = 9, tox = 310, toy = 74, toz = 9},  -- Checar se o boss esta vivo
                {fromx = 316, fromy = 50, fromz = 9, tox = 350, toy = 74, toz = 9},  -- Checar se o boss esta vivo
                
            },

            checkBauChest = { -- posi��es norte esquerda e sul direita da sala
                {fromx = 246, fromy = 27, fromz = 9, tox = 253, toy = 31, toz = 9},  -- Checar se o jogador est� na sala
                {fromx = 282, fromy = 26, fromz = 9, tox = 289, toy = 30, toz = 9},
                {fromx = 332, fromy = 25, fromz = 9, tox = 339, toy = 29, toz = 9},  
                
            },

            reward_position = { -- centro da sala
                -- posi��o da sala do ba�
                {x = 249, y = 29, z = 9},
                {x = 285, y = 28, z = 9},
                {x = 336, y = 27, z = 9},
            },

            monstersList = {
                {
                -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Dungeon Yakon", {x = 242, y = 51, z = 9}},
                    {"Dungeon Yakon", {x = 244, y = 64, z = 9}},
                    {"Dungeon Yakon", {x = 249, y = 70, z = 9}},
                    {"Dungeon Yakon", {x = 258, y = 70, z = 9}},
                    {"Dungeon Yakon", {x = 268, y = 61, z = 9}},
                },

                {
                    -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Dungeon Yakon", {x = 282, y = 54, z = 9}},
                    {"Dungeon Yakon", {x = 284, y = 66, z = 9}},
                    {"Dungeon Yakon", {x = 296, y = 67, z = 9}},
                    {"Dungeon Yakon", {x = 304, y = 60, z = 9}},
                    {"Dungeon Yakon", {x = 294, y = 55, z = 9}},
                },

                {
                    -- Nome do monstro e a posi��o de cada monstro dentro da posi��o da dungeon
                    {"Dungeon Yakon", {x = 324, y = 56, z = 9}},
                    {"Dungeon Yakon", {x = 325, y = 66, z = 9}},
                    {"Dungeon Yakon", {x = 333, y = 67, z = 9}},
                    {"Dungeon Yakon", {x = 344, y = 60, z = 9}},
                    {"Dungeon Yakon", {x = 332, y = 54, z = 9}},
                },   
            },

            bossList = {
                {name = {"Boss Yakon"}, pos = {x = 254, y = 62, z = 9}}, -- Posi��o do boss dentro da dungeon
                {name = {"Boss Yakon"}, pos = {x = 293, y = 62, z = 9}}, -- Posi��o do boss dentro da dungeon
                {name = {"Boss Yakon"}, pos = {x = 334, y = 62, z = 9}}, -- Posi��o do boss dentro da dungeon
            },
        },
    },

    ["E-Jounnin"] =
    {
        [1] =
        {
            pos = {
                {x = 1062, y = 1519, z = 7}, 
                {x = 1049, y = 1519, z = 6},
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
            },

            chest_pos = {
                 {x = 1051, y = 1515,z = 5},
                 {x = 1051, y = 1515,z = 5},
            },

            arenaDungeon_pos = { -- Checar quantos monstros tem na area
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
            },

            bossDungeon_pos = { -- Checar se o boss esta vivo
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
            },

            monstersList = {
                {name = {"Wolf"}},
                {name = {"Wolf"}},
            },

            bossList = {
                {name = "Bear Thief"},
                {name = "Bear Thief"},
            },
        },
    },

    ["Sannin/Kage"] =
    {
        [1] =
        {
            pos = {
                {x = 1062, y = 1519, z = 7}, 
                {x = 1049, y = 1519, z = 6},
            },

            pos_areas_checkHasPlayer = {
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
                {fromx = 1047, fromy = 1048, fromz = 7, tox = 1090, toy = 1150, toz = 7},
            },

            chest_pos = {
                 {x = 1051, y = 1515,z = 5},
                 {x = 1051, y = 1515,z = 5},
            },

            arenaDungeon_pos = { -- Checar quantos monstros tem na area
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
                {fromx = 1037, fromy = 1502, fromz = 7, tox = 1063, toy = 1528, toz = 7},
            },

            bossDungeon_pos = { -- Checar se o boss esta vivo
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
                {fromx = 1039, fromy = 1504, fromz = 6, tox = 1061, toy = 1526, toz = 6},
            },

            monstersList = {
                {name = {"Wolf"}},
                {name = {"Wolf"}},
            },

            bossList = {
                {name = "Bear Thief"},
                {name = "Bear Thief"},
            },
        },
    },
}

-- Id dos items para entrar na DG
DUNGEONS_ITEMS_NECESSARY = {
    [1] = {id = 19185, count = 1}, --19185 Bronze Key
    [2] = {id = 19183, count = 1}, --19183 Silver Key
    [3] = {id = 19186, count = 1}, --19186 Golden Key
    [4] = {id = 19184, count = 1}, --19184 Diamond Key
}

-- Aqui voce coloca as dungeons que vao come�ar em x horario
DUNGEONS_START_HOUR = {
    ["16:24:00"] = -- horario de abrir
    {
        ["Gennin/Chunnin"] =
        {
            [1] = {
                message = "A dungeon: A Grande Guerra Ninja Começou!", 
                storageGlobal = 8596, 
                action = "open",
            }, -- kabuto
        },
    },

    ["16:25:00"] = -- horario de fechar
    {
        ["Gennin/Chunnin"] =
        {
            [1] = {
                message = "A dungeon: A Grande Guerra Ninja fechou!", 
                storageGlobal = 8596, 
                action = "close",
            }, -- Madara
        },
    },
}

function getPlayersInAreaDungeon(area)
    local players = {}
    for x = area.fromx,area.tox do
        for y = area.fromy,area.toy do
            for z = area.fromz,area.toz do
                local m = getTopCreature({x=x, y=y, z=z}).uid
                if m ~= 0 and isPlayer(m) then
                    table.insert(players, m)
                end
            end
        end
    end
    return players
end

function isPlayerInRewardRoom(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.checkBauChest) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, v in ipairs(tabela.reward_position) do
                if indice == k then
                    local specter = getSpectators({x = v.x, y = v.y, z = v.z}, 5, 5, false)
                    if specter then
                        for _, spec in pairs(specter) do
                            if isPlayer(spec) then
                                return true
                            end
                        end
                    end
                end
            end
        end
    end

    return false
end

function getMonstersInAreaDungeon(area)
	local monsters = {}
	local centerPos = {x = math.floor(area.fromx + (area.tox - area.fromx) / 2), y = math.floor(area.fromy + (area.toy - area.fromy) / 2), z = math.floor(area.fromz + (area.toz - area.fromz) / 2)}
	local rangex = area.tox - area.fromx
	local rangey = area.toy - area.fromy
	local spectators = getSpectators(centerPos, rangex, rangey, false)
    if spectators then
        for i, uid in pairs(spectators) do
            if uid then
                if isMonster(uid) then
                    table.insert(monsters, uid)
                end
            end
        end
    end
	return monsters
end

function isWalkable(pos, creature, proj, pz)
    if getTileThingByPos({x=pos.x,y=pos.y,z=pos.z,stackpos=0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end

function checkSalaDisponivel(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for k, v in ipairs(tabela.pos_areas_checkHasPlayer) do
        if #getPlayersInAreaDungeon(v) <= 0 then
            for kk, vv in ipairs(tabela.pos) do
                if k == kk then
                    return vv
                end
            end
        end
    end
    return nil
end

function checkSalaDisponivelSpawnMonster(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local createdMonsters = {}
    for i, sala in ipairs(tabela.pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = {x = sala.x, y = sala.y, z = sala.z}
        if posPlayer.x == salaCreate.x and posPlayer.y == salaCreate.y and posPlayer.z == salaCreate.z then
            for j, monsterData in ipairs(tabela.monstersList[i]) do
                local monsterName = monsterData[1]
                local monsterPos = monsterData[2]
                local pos = monsterPos.x .. "," .. monsterPos.y .. "," .. monsterPos.z
                if not createdMonsters[pos] then
                    createdMonsters[pos] = true
                    doCreateMonster(monsterName, monsterPos, false)
                end
            end
        end
    end
end

function removeMonstersInArea(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for i, sala in ipairs(tabela.pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = {x = sala.x, y = sala.y, z = sala.z}
        if posPlayer.x == salaCreate.x and posPlayer.y == salaCreate.y and posPlayer.z == salaCreate.z then
            if tabela.arenaDungeon_pos then
                for k, v in ipairs(tabela.arenaDungeon_pos) do
                    if k == i then
                        local monsters = getMonstersInAreaDungeon(v)
                        if monsters then
                            for j = 1, #monsters do
                                doRemoveCreature(monsters[j])
                            end
                        end
                    end
                end
            end
        end
    end

    return true
end

function checkSalaDisponivelSpawnMonsterBoss(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, v in ipairs(tabela.bossList) do
                if indice == k then
                    for i = 1, #v.name do
                        doCreateMonster(v.name[i], v.pos, 1)
                    end
                end
            end
        end
    end
    return nil
end

function isInAreadungeon(pos, area)
    return pos.x >= area.startX and pos.x <= area.endX and pos.y >= area.startY and pos.y <= area.endY and pos.z >= area.startZ and pos.z <= area.endZ
end

function checkSalaDisponivelParty(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local pos_areas_checkHasPlayer = tabela.pos_areas_checkHasPlayer
    local partyMembers = getPartyMembers(cid)

    for i, pos in ipairs(tabela.pos) do
        local playersInArea = getPlayersInAreaDungeon(pos_areas_checkHasPlayer[i])
        if #playersInArea == 0 then
            -- doTeleportThing(leader, pos)
            for j, member in ipairs(partyMembers) do
                doTeleportThing(member, pos)
                local position = getCreaturePosition(cid)
            end
            break
        end
    end
end

function getSalaDisponivelParty(category, numeration)
    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    local pos_areas_checkHasPlayer = tabela.pos_areas_checkHasPlayer

    for i, pos in ipairs(tabela.pos) do
        local playersInArea = getPlayersInAreaDungeon(pos_areas_checkHasPlayer[i])
        if #playersInArea == 0 then
            return false
        end
    end
    return true
end

function checkSalaDisponivelMonstros(cid, category, numeration)
    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return 0 end
    tabela = tabela[numeration]

    for k, sala in ipairs(tabela.arenaDungeon_pos) do
        local posPlayer = getCreaturePosition(cid)
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        if isInAreadungeon(posPlayer, salaCreate) then
            return #getMonstersInAreaDungeon(sala)
        end
    end

    return 0
end

function checkSalaDisponivelBau(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, teleport in ipairs(tabela.chest_pos) do
                if indice == k then
                    doTeleportThing(cid, teleport)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Iniciante")
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                    setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
                end
            end
        end
    end
end

function checkSalaDisponivelBauParty(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    for indice, sala in ipairs(tabela.arenaDungeon_pos) do
        local salaCreate = { startX = sala.fromx, endX = sala.tox, startY = sala.fromy, endY = sala.toy, startZ = sala.fromz, endZ = sala.toz}
        local posPlayer = getCreaturePosition(cid)
        if isInAreadungeon(posPlayer, salaCreate) then
            for k, teleport in ipairs(tabela.chest_pos) do
                if indice == k then
                    doTeleportThing(cid, teleport)
                    for z, v in ipairs(getPartyMembers(cid)) do
                        doTeleportThing(v, getCreaturePosition(cid))
                        setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, 1)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, "Iniciante")
                        setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                        doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")
                    end
                end
            end
        end
    end
end

function getSalasDisponiveis(cid, category)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_SALAS[category]
    if not tabela then return true end

    return #tabela
end

-- Remover informacoes anteriores da janela
function destroyInfoDungeon(cid)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_levels".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_difficulty".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_missions".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_items".."@")
    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")
    return true
end

-- Enviar as informacoes janela de dungeon
function sendDungeon(cid, category)
    if not isPlayer(cid) then
        return true
    end

    destroyInfoDungeon(cid) -- destruir infos antigas
    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    for i = 1, #DUNGEON_LEVELS do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_LEVEL, DUNGEON_LEVELS[i].."@")
    end

    for i = 1, #DUNGEON_DIFFICULTYS do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DIFFICULTY, DUNGEON_DIFFICULTYS[i].."@"..i.."@")
    end

    for i = 1, #tabela do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_MISSIONS, tabela[i].image.."@"..tabela[i].name.."@"..tabela[i].players.."@"..i.."@"..getSalasDisponiveis(cid, category).."@")
    end

    if getPartyMembers(cid) ~= false then
        for k, v in ipairs(getPartyMembers(cid)) do
            doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

            for i = 1, #getPartyMembers(cid) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYERS_PARTY, getCreatureName(getPartyMembers(cid)[i]).."@"..getPlayerLevel(getPartyMembers(cid)[i]).."@"..math.floor(getCreatureHealth(getPartyMembers(cid)[i]) / getCreatureMaxHealth(getPartyMembers(cid)[i]) * 100).."@")
            end
        end
    end
    return true
end

-- Trocar a categoria da dungeon
function changeDungeonCategory(cid, category)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_missions".."@")

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    for i = 1, #tabela do
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_MISSIONS, tabela[i].image.."@"..tabela[i].name.."@"..tabela[i].players.."@"..i.."@"..getSalasDisponiveis(cid, category).."@")
    end
    return true
end

-- Enviar recompensa para o player
function sendRecompenseToPlayer(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end

    tabela = tabela[numeration]
    if not tabela.recompense_list then print("Category: " .. category .. " don't have a recompense list.") return true end

    local recompensa = {}
    for i = 1, #tabela.recompense_list do
        table.insert(recompensa, getItemInfo(tabela.recompense_list[i]).name .. " (" .. tabela.count[i] .. "x)\n")
    end

    doPlayerPopupFYI(cid, "As seguintes recompensas da Dungeon "..tabela.name.." s�o:\n" ..table.concat(recompensa))
    return true
end

-- Enviar convite para o jogador
function sendInviteToPlayer(cid, name)
    if not isPlayer(cid) then
        return true
    end

    if name == getCreatureName(cid) then
        doPlayerPopupFYI(cid, "Voc� n�o pode convidar a si mesmo.")
        return true
    end

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players <= 0 then
        doPlayerPopupFYI(cid, "Um jogador com este nome n�o existe ou n�o est� online.")
        return true
    end

    if #players > 0 then
        for i = 1, #players do
            doSendPlayerExtendedOpcode(players[i], DUNGEON_OPCODE_INVITE, getCreatureName(cid).."@"..name.."@")
            doPlayerInviteParty(players[i], cid)
        end

        doPlayerPopupFYI(cid, "Um convite foi enviado com sucesso para o jogador: " .. name .. ".")
    end
    return true
end

-- Aceitar o convite do jogador
function acceptPlayerDungeon(cid, name)
    if not isPlayer(cid) then
        return true
    end

    doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players > 0 then
        for i = 1, #players do
            doPlayerPopupFYI(players[i], "O jogador: " .. getCreatureName(cid) .. " aceitou seu pedido de dungeon.")
            doPlayerJoinParty(cid, players[i])
        end
    end

    if getPartyMembers(cid) ~= false then
        for k, v in ipairs(getPartyMembers(cid)) do
            doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_DESTROYINFO, "destroyInfo_team".."@")

            for i = 1, #getPartyMembers(cid) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYERS_PARTY, getCreatureName(getPartyMembers(cid)[i]).."@"..getPlayerLevel(getPartyMembers(cid)[i]).."@"..math.floor(getCreatureHealth(getPartyMembers(cid)[i]) / getCreatureMaxHealth(getPartyMembers(cid)[i]) * 100).."@")
            end
        end
    end
    return true
end

-- Negar o convite do jogador
function denyPlayerDungeon(cid, name)
    if not isPlayer(cid) then
        return true
    end

    local players = {}
    for k, v in ipairs(getPlayersOnline()) do
        if getCreatureName(v) == name then
            table.insert(players, v)
        end
    end

    if #players > 0 then
        for i = 1, #players do
            doPlayerPopupFYI(players[i], "O jogador: " .. getCreatureName(cid) .. " negou seu pedido de dungeon.")
        end
    end
    return true
end

-- Entrar na Dungeon
function enterDungeon(cid, category, numeration)
    if not isPlayer(cid) then
        return true
    end

    if getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) - os.time() > 0 then
        doPlayerPopupFYI(cid, "Voc� j� est� em uma dungeon.")
        return true
    end

    local tabela = DUNGEONS_MISSIONCATEGORY[category]
    if not tabela then return true end
    tabela = tabela[numeration]

    if tabela.isHour == true and getGlobalStorageValue(tabela.storageGlobal) <= 0 then
        doPlayerPopupFYI(cid, "A dungeon n�o come�ou ainda!")
        return true
    end

    if tabela.players > 1 then
        if getPartyMembers(cid) ~= false then
            if #getPartyMembers(cid) < tabela.players then
                doPlayerPopupFYI(cid, "Seu grupo n�o tem pessoas suficientes para esta dungeon, o n�mero necessario de: " .. tabela.players .. " players.")
                return true
            end

            if getPlayerParty(cid) ~= cid then
                doPlayerPopupFYI(cid, "Apenas o lider pode iniciar a dungeon.")
                return true
            end

            if getSalaDisponivelParty(category, numeration) == true then
                doPlayerPopupFYI(cid, "As salas est�o lotadas.")
                return true
            end

            local allMembersHaveItems = true
            for k, v in ipairs(getPartyMembers(cid)) do
                for i = 1, #tabela.items do
                    if getPlayerItemCount(v, tabela.items[i], -1) < tabela.count_req[i] then
                        allMembersHaveItems = false
                    end
                end
            end

            if allMembersHaveItems == false then
                doPlayerPopupFYI(cid, "Voc� ou seu parceiro n�o possuem os items da dungeon.")
                return true
            end

            checkSalaDisponivelParty(cid, category, numeration) 
            removeMonstersInArea(cid, category, numeration)
            checkSalaDisponivelSpawnMonster(cid, category, numeration)

            for k, v in ipairs(getPartyMembers(cid)) do
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_CLOSEWINDOW, "hide".."@")
                doPlayerPopupFYI(v, "A dungeon de voc�s come�ou, boa sorte!")
                registerCreatureEvent(v, "KillDungeonBoss")

		        for i = 1, #tabela.items do
                   doPlayerRemoveItem(v, tabela.items[i], tabela.count_req[i])
                end

                setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, os.time() + tabela.dungeon_time)
                setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, numeration)
                setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, category)
                setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, checkSalaDisponivelMonstros(v, category, numeration))
                setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                addEvent(function()
                    if getPlayerStorageValue(v, DUNGEON_STORAGE_TIME) > os.time()  then
                        setPlayerStorageValue(v, DUNGEON_STORAGE_TIME, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_NUMERATION, 1)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_CATEGORY, "Gennin/Chunnin")
                        setPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                        setPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                        doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")

                        doPlayerSendTextMessage(v, 25, "Tempo esgotado! Voc� foi kickado para fora da dungeon.")
                        doTeleportThing(v, getTownTemplePosition(getPlayerTown(v)))
                    end
                end, tabela.dungeon_time_miliseconds)

                local storage = getPlayerStorageValue(v, DUNGEON_STORAGE_KILLEDCREATURES) or 0
                if storage <= 0 then storage = 0 end

                local storage2 = getPlayerStorageValue(v, DUNGEON_STORAGE_TIME) or 0
                local monsters_killed = storage .. " / " ..getPlayerStorageValue(v, DUNGEON_STORAGE_COUNTCREATURES_AREA)
                doSendPlayerExtendedOpcode(v, DUNGEON_OPCODE_PLAYER_TIME_MODULE, storage2.."@"..monsters_killed.."@")
            end
        else
            doPlayerPopupFYI(cid, "Voc� precisa estar em um grupo de no min�mo: " .. tabela.players .. " pessoas.")
        end
    else
        if getPartyMembers(cid) ~= false then
            if #getPartyMembers(cid) > tabela.players then
                doPlayerPopupFYI(cid, "Voc� n�o pode participar de uma dungeon de 1 player em uma party.")
                return true
            end
        end

        local boleano = false
        for i = 1, #tabela.items do
            if getPlayerItemCount(cid, tabela.items[i], -1) < tabela.count_req[i] then
                boleano = false
            else
                boleano = true
            end
        end

        if boleano == false then
            doPlayerPopupFYI(cid, "Voc� n�o possui os items necess�rios para entrar na Dungeon.")
            return true
        end

        if checkSalaDisponivel(cid, category, numeration) == nil then
            doPlayerPopupFYI(cid, "As salas est�o lotadas.")
            return true
        end

        
        doTeleportThing(cid, checkSalaDisponivel(cid, category, numeration))
        removeMonstersInArea(cid, category, numeration)
        checkSalaDisponivelSpawnMonster(cid, category, numeration)
        doPlayerPopupFYI(cid, "A sua dungeon come�ou, boa sorte!")
        registerCreatureEvent(cid, "KillDungeonBoss")

        for i = 1, #tabela.items do
           doPlayerRemoveItem(cid, tabela.items[i], tabela.count_req[i])
        end

        setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, os.time() + tabela.dungeon_time)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, numeration)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, category)
        setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, checkSalaDisponivelMonstros(cid, category, numeration))
        setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
        addEvent(function()
            if isPlayerInRewardRoom(cid, category, numeration) == false and getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) > os.time() then
                setPlayerStorageValue(cid, DUNGEON_STORAGE_TIME, 0)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_NUMERATION, 1)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_CATEGORY, "Iniciante")
                setPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES, 0)
                setPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA, 0)
                doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_HIDE_TIME_MODULE, "hide".."@")

                doPlayerSendTextMessage(cid, 25, "Tempo esgotado! Voc� foi kickado para fora da dungeon.")
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
            end
        end, tabela.dungeon_time_miliseconds)

        local storage = getPlayerStorageValue(cid, DUNGEON_STORAGE_KILLEDCREATURES) or 0
        if storage <= 0 then storage = 0 end

        local storage2 = getPlayerStorageValue(cid, DUNGEON_STORAGE_TIME) or 0
        local monsters_killed = storage .. " / " ..getPlayerStorageValue(cid, DUNGEON_STORAGE_COUNTCREATURES_AREA)
        doSendPlayerExtendedOpcode(cid, DUNGEON_OPCODE_PLAYER_TIME_MODULE, storage2.."@"..monsters_killed.."@")
    end
    return true
end