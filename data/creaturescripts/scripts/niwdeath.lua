local table = {
-- Sasuke ---
[10] = 10966,
-- Naruto ---
[1] = 10948,
-- itachi ---
[100] = 10949,
-- Jiraya ---
[190] = 10950,
-- kakashi---
[120] = 10961,
-- bee---
[110] = 10947,
-- hinata---
[80] = 10954,
-- shikamaru---
[70] = 10940,
-- obito---
[130] = 10953,
-- neji---
[50] = 10965,
-- gaara---
[40] = 10945,
-- lee---
[20] = 10964,
-- madara---
[140] = 10962,
-- tsunade---
[330] = 10939,
-- tobirama---
[250] = 10968,
-- hashi---
[280] = 10970,
-- haku---
[290] = 12084,
-- guren---
[300] = 11005,
-- sasori---
[320] = 11006,
-- kankuro---
[170] = 10946,
-- minato---
[180] = 10951,
-- orochi---
[210] = 10998,
-- shisui---
[260] = 12057,
-- sai---
[270] = 11002,
-- raikage---
[200] = 10957,
-- ino---
[340] = 11000,
-- hidan---
[360] = 11007,
-- suigetsu---
[350] = 11009,
-- onoki---
[390] = 11008,
-- might guy---
[380] = 10997,
-- danzou---
[370] = 10959


}

local function transform(pos, id, voc)
local item = getTileItemById(pos, id)
if item and item.uid > 1 then
doTransformItem(item.uid, table[voc])
doDecayItem(item.uid or 0)
end
end

function onDeath(cid, corpse)
if not isPlayer(cid) or not table[getPlayerVocation(cid)] then return true end
addEvent(transform, 15, getThingPos(cid), corpse.itemid, getPlayerVocation(cid))
return true
end