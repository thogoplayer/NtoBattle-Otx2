local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 1, 877},         --naruto     
[10] = { 10, 836},         --sasuke     
[20] = { 20, 868},         --lee     
[30] = { 30, 837},         --sakura     
[40] = { 40, 864},         --gaara     
[50] = { 50, 870},         --neji     
[60] = { 60, 894},         --kiba     
[70] = { 70, 889},         --shikamaru     
[80] = { 80, 869},         --hinata     
[90] = { 90, 874},         --tenten     
[100] = { 100, 1419},         --itachi     
[110] = { 110, 838},         --bee     
[120] = { 120, 896},         --kakashi     
[130] = { 130, 881},         --obito     
[140] = { 140, 1418},         --madara     
[150] = { 150, 858},         --nagato     
[160] = { 160, 1146},         --kisame     
[170] = { 170, 821},         --kankuro     
[180] = { 180, 1417},         --minato     
[190] = { 190, 841},         --jiraya     
[200] = { 200, 873},         --raikage     
[210] = { 210, 886},         --orochimaru     faltando
[220] = { 220, 891},         --temari     
[230] = { 230, 871},         --yamato     
[240] = { 240, 888},         --deidara     
[250] = { 250, 826},         --tobirama     
[260] = { 260, 1410},        --shisui     
[270] = { 270, 820},         --sai     
[280] = { 280, 825},         --hashirama     
[290] = { 290, 851},         --haku     
[300] = { 300, 1413},        --guren     
[310] = { 310, 1650},        --kaguya     
[320] = { 320, 884},         --sasori     
[330] = { 330, 895},         --tsunade     
[340] = { 340, 878},         --ino     
[350] = { 350, 866},         --suigetsu     
[360] = { 360, 842},         --hidan     
[370] = { 370, 833},         --danzou     
[380] = { 380, 68},          --guy     
[390] = { 390, 843},         --onoki     
[400] = { 400, 834},         --kurenai     
[410] = { 410, 855},         --mu     
[420] = { 420, 899},         --sarutobi     
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
doCreatureChangeOutfit(cid, {lookType = voc[2]})
doSendMagicEffect(getCreaturePosition(cid), 10)
exhaustion.set(cid, 120, 0.5)
else
doPlayerSendTextMessage(cid, 22, "Voce precisa ser akatsuki para usar este comando.")
return true
end
end
end


