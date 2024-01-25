local info = {
[10] = {speed = 238},
[50] = {speed = 318},
[100] = {speed = 418},
[150] = {speed = 518},
[200] = {speed = 618},
[250] = {speed = 718},
[300] = {speed = 818},
[350] = {speed = 918},
[400] = {speed = 1018},
[450] = {speed = 1118},
[500] = {speed = 1218},
[550] = {speed = 1318},
[600] = {speed = 1418},
[650] = {speed = 1518},
[700] = {speed = 1618},
[750] = {speed = 1718},
[800] = {speed = 1818},
[999] = {speed = 2218}
}

function onAdvance(cid, skill, oldLevel, newLevel)
    for level, x in pairs(info) do
        if skill == 8 and newLevel >= level then
            doChangeSpeed(cid, -getCreatureSpeed(cid))
            doChangeSpeed(cid, info.speed)
        end
    end
return 1
end