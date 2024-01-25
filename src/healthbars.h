////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////

#ifndef __HEALTHBARS__
#define __HEALTHBARS__
#include "otsystem.h"

#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

struct HealthBar
{
	HealthBar(uint32_t id, std::string name)
		: name(name), id(id) {}

	std::string name;
	uint32_t id;
};

typedef std::map<uint32_t, HealthBar*> HealthBarsMap;
class HealthBars
{
	public:
		virtual ~HealthBars() {clear();}

		static HealthBars* getInstance()
		{
			static HealthBars instance;
			return &instance;
		}

		bool loadFromXml();
		bool parseHealthBarsNode(xmlNodePtr p);

		void clear();
		bool reload();

        const HealthBarsMap& getHealthBars() {return healthBarsMap;}
		HealthBar* getHealthBar(uint32_t healthBarId);
		uint32_t getHealthBarId(const std::string& name);

		HealthBarsMap::iterator getFirstGroup() {return healthBarsMap.begin();}
		HealthBarsMap::iterator getLastGroup() {return healthBarsMap.end();}

	private:
		HealthBars() {}
		HealthBarsMap healthBarsMap;
};
#endif
