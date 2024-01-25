local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 1, 1173},         --naruto       ------ok
[10] = { 10, 1389},         --sasuke     ------ok
[20] = { 20, 1168},         --lee        ------ok
[30] = { 30, 1423},         --sakura     ------ok   
[40] = { 40, 1395},         --gaara      ------ok
[50] = { 50, 1425},         --neji       ------ok
[60] = { 60, 1393},         --kiba       ------ok
[70] = { 70, 1426},         --shikamaru  ------ok
[80] = { 80, 1424},         --hinata     ------ok
[90] = { 90, 1428},         --tenten     ------ok
[100] = { 100, 1414},         --itachi   ------ok
[110] = { 110, 1118},         --bee      ------ok
[120] = { 120, 1165},         --kakashi  ------ok 
[130] = { 130, 1121},         --obito    ------ok
[140] = { 140, 1403},         --madara   ------ok
[150] = { 150, 1400},         --nagato   ------ok
[160] = { 160, 1120},         --kisame   ------ok 
[170] = { 170, 1128},         --kankuro  ------ok 
[180] = { 180, 1391},         --minato   ------ok
[190] = { 190, 1402},         --jiraya   ------ok
[200] = { 200, 1100},         --raikage  ------ok 
[210] = { 210, 1132},         --orochi   ------ok
[220] = { 220, 1396},         --temari   ------ok
[230] = { 230, 1117},         --yamato   ------ok  
[240] = { 240, 1404},         --deidara  ------ok
[250] = { 250, 826},         --tobirama  ------   
[260] = { 260, 1409},         --shisui   ------ok
[270] = { 270, 1427},         --sai      ------ok
[280] = { 280, 1431},         --hashi    ------ok  
[290] = { 290, 1126},         --haku     ------ok
[300] = { 300, 1171},         --guren    ------ok   
[310] = { 310, 1416},         --kaguya   ------ok
[320] = { 320, 1170},         --sasori   ------ok 
[330] = { 330, 1429},         --tsunade  ------ok  
[340] = { 340, 1169},         --ino      ------ok
[350] = { 350, 1133},         --suigetsu ------ok 
[360] = { 360, 1119},         --hidan    ------ok
[370] = { 370, 1124},         --danzou   ------ok  
[380] = { 380, 1415},         --guy      ------ok
[390] = { 390, 1172},         --onoki    ------ok  
[400] = { 400, 834},         --kurenai   ------  
[410] = { 410, 855},         --mu        ------
[420] = { 420, 1411},         --sarutobi ------ok 
}


function onCastSpell(cid, var)


if exhaustion.check(cid, 120) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return true
end


local voc = config[getPlayerVocation(cid)]

if voc then
if getPlayerStorageValue(cid, 89745) >= 2 then
doCreatureSay(cid, "!Akatsuki Mode", TALKTYPE_MONSTER)
local outfit = {lookType = voc[2]}
if getPlayerVocation(cid) == 38 then
setPlayerStorageValue(cid, 93123,7) 
end
if getPlayerVocation(cid) == 380 then
setPlayerStorageValue(cid, 93125,5) 
end
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), 10)
exhaustion.set(cid, 120, 0.5)
else
doPlayerSendTextMessage(cid, 22, "Voce precisa ser akatsuki para usar este comando.")
return true
end
end
end


