conf = { 
     [1] = { boss = "shukaku", msg = "[Invasion System] o %s apareceu, ela pode ser localizado na area de invasao" },  -- %s e o nome do monstro
	 [2] = { boss = "choumei", msg = "[Invasion System] a %s apareceu, ele pode ser localizado na area de invasao" },         
	 [3] = { boss = "gyuki", msg = "[Invasion System] o %s apareceu, ela pode ser localizado na area de invasao" },		
	 [4] = { boss = "isobu", msg = "[Invasion System] o %s apareceu, ele pode ser localizado na area de invasao" },	
	 [5] = { boss = "kokuou", msg = "[Invasion System] a %s apareceu, ela pode ser localizado na area de invasao" },
     [6] = { boss = "matatabi", msg = "[Invasion System] a %s apareceu, ela pode ser localizado na area de invasao" },	
     [7] = { boss = "saiken", msg = "[Invasion System] a %s apareceu, ela pode ser localizado na area de invasao" },		 
     [8] = { boss = "son goku", msg = "[Invasion System] o %s apareceu, ela pode ser localizado na area de invasao" },		 		 
     }
	 
	 local pos = { 
	 {x = 2239, y = 1795, z = 6},
	 {x = 2206, y = 1791, z = 7},
	 {x = 2234, y = 1810, z = 7},
	 {x = 2269, y = 1810, z = 7},
	 {x = 2270, y = 1799, z = 7},
	 {x = 2278, y = 1781, z = 7},
	 {x = 2243, y = 1785, z = 7},
	 }
	 
local PositionMobs = {
{x = 2201, y = 1790, z = 7},
{x = 2201, y = 1801, z = 7},
{x = 2209, y = 1808, z = 7},
{x = 2215, y = 1793, z = 7},
{x = 2227, y = 1787, z = 7},
{x = 2223, y = 1807, z = 7},
{x = 2231, y = 1810, z = 7},
{x = 2239, y = 1807, z = 7},
{x = 2245, y = 1813, z = 7},
{x = 2254, y = 1810, z = 7},
{x = 2264, y = 1812, z = 7},
{x = 2274, y = 1812, z = 7},
{x = 2260, y = 1805, z = 7},
{x = 2272, y = 1803, z = 7},
{x = 2265, y = 1798, z = 7},
{x = 2261, y = 1797, z = 7},
{x = 2254, y = 1792, z = 7},
{x = 2277, y = 1793, z = 7},
{x = 2269, y = 1789, z = 7},
{x = 2260, y = 1789, z = 7},
}



local m = {"huntsman", "senjuu kyodaijya", "gerotora", "gen zetsu"} -- Coloque os monstros que quer que nasça nas areas


function onTime(interval)
local p = conf[math.random(1,#conf)]
local w = pos[math.random(1,#pos)]
	doCreateMonster(p.boss, w)
	doBroadcastMessage(p.msg:format(p.boss), 21)
	 for _, tPos in ipairs(PositionMobs) do
	 doCreateMonster(m[math.random(1,#m)], tPos)
	 end
return true
end 