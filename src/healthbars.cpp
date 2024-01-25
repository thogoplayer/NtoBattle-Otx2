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
#include "otpch.h"
#include <iostream>

#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

#include "healthbars.h"
#include "tools.h"

void HealthBars::clear()
{
	for(HealthBarsMap::iterator it = healthBarsMap.begin(); it != healthBarsMap.end(); ++it)
		delete it->second;

	healthBarsMap.clear();
}

bool HealthBars::reload()
{
	clear();
	return loadFromXml();
}

bool HealthBars::loadFromXml()
{
	xmlDocPtr doc = xmlParseFile(getFilePath(FILE_TYPE_XML, "healthbars.xml").c_str());
	if(!doc)
	{
		std::cout << "[Warning - HealthBars::loadFromXml] Cannot load healthbars file." << std::endl;
		std::cout << getLastXMLError() << std::endl;
		return false;
	}

	xmlNodePtr p, root = xmlDocGetRootElement(doc);
	if(xmlStrcmp(root->name,(const xmlChar*)"healthbars"))
	{
		std::cout << "[Error - HealthBars::loadFromXml] Malformed healthbars file." << std::endl;
		xmlFreeDoc(doc);
		return false;
	}

	p = root->children;
	while(p)
	{
		parseHealthBarsNode(p);
		p = p->next;
	}

	xmlFreeDoc(doc);
	return true;
}

bool HealthBars::parseHealthBarsNode(xmlNodePtr p)
{
	if(xmlStrcmp(p->name, (const xmlChar*)"healthbar"))
		return false;

	int32_t healthBarId;
	if(!readXMLInteger(p, "id", healthBarId))
	{
		std::cout << "[Warning - HealthBars::parseHealthBarsNode] Missing healthbar id." << std::endl;
		return false;
	}

	std::string healthBarName;
	if(!readXMLString(p, "name", healthBarName))
	{
		std::cout << "[Warning - HealthBars::parseHealthBarsNode] Missing healthbar name." << std::endl;
		return false;
	}

    HealthBar* healthbar = new HealthBar(healthBarId, healthBarName);
	healthBarsMap[healthbar->id] = healthbar;
	return true;
}

uint32_t HealthBars::getHealthBarId(const std::string& name)
{
	for(HealthBarsMap::iterator it = healthBarsMap.begin(); it != healthBarsMap.end(); ++it)
	{
		if(!strcasecmp(it->second->name.c_str(), name.c_str()))
			return it->first;
	}

	return -1;
}

HealthBar* HealthBars::getHealthBar(uint32_t healthBarId) {
    HealthBarsMap::iterator it = healthBarsMap.find(healthBarId);
    if (it == healthBarsMap.end())
        return NULL;

    return it->second;
}
