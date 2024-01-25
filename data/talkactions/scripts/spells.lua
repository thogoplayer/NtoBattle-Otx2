function onSay(cid, words, param)
local count = getPlayerInstantSpellCount(cid)
local text = ""
local t = {}
for i = 0, count - 1 do
local spell = getPlayerInstantSpellInfo(cid, i)
if spell.level ~= 0 then
if spell.manapercent > 0 then
spell.mana = spell.manapercent .. "%"
end
table.insert(t, spell)
end
end
table.sort(t, function(a, b) return a.level < b.level end)
local prevLevel = -1
for i, spell in ipairs(t) do
local line = ""
if prevLevel ~= spell.level then
if i ~= 1 then
line = "\n"
end
line = line .. "Jutsus de Level [" .. spell.level .. "]\n"
prevLevel = spell.level
end
text = text .. line .. "Jutsu: " .. spell.words .. " \nMana: [" .. spell.mana.."]\n"
end
doShowTextDialog(cid, 2175, text)
return true
end
-- function onSay(cid, words, param)
-- local count = getPlayerInstantSpellCount(cid)
-- local text = ""
-- local t = {}
-- for i = 0, count - 1 do
-- local spell = getPlayerInstantSpellInfo(cid, i)
-- if spell.level ~= 0 then
-- if spell.manapercent > 0 then
-- spell.mana = spell.manapercent .. "%"
-- end
-- if spell.type == "" then
-- spell.type = ""
-- else
-- spell.type = "\nType: "..spell.type .. ""
-- end
-- if spell.desc == "" then
-- spell.desc = ""
-- else
-- spell.desc = "\nDesc: "..spell.desc .. ""
-- end
-- table.insert(t, spell)
-- end
-- end
-- table.sort(t, function(a, b) return a.level < b.level end)
-- local prevLevel = -1
-- for i, spell in ipairs(t) do
-- local line = ""
-- if prevLevel ~= spell.level then
-- if i ~= 1 then
-- line = "\n"
-- end
-- line = line .. "->Jutsus para o level " .. spell.level .. "<-\n"
-- prevLevel = spell.level
-- end
-- text = text .. line .. "Jutsu: " .. spell.words .. " \nMana: " .. spell.mana .. "" .. spell.type .. "" .. spell.desc .. "\n\n"
-- end
-- doShowTextDialog(cid, 2175, text)
-- return true
-- end