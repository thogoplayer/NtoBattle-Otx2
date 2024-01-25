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

#include "localization.h"

#include <fstream>
#include <sstream>
#include <map>
#include <boost/regex.hpp>

typedef std::map<std::string, std::string> LocalizationMap;
LocalizationMap pt_br;
LocalizationMap po_po;

std::map<LocalizationLang_t, LocalizationMap*> languages;                 


void LoadLocalizations()
{           
    std::clog << ">>>Loading PT_BR ... ";
    std::ifstream input_pt("pt_br.loc");
    
    for (std::string line_pt; getline(input_pt, line_pt);) {
        std::istringstream ss_pt(line_pt);
        std::string token_pt;
        
        std::string id_pt = "";
        std::string value_pt = "";
        
        while (std::getline(ss_pt, token_pt, '@')) {
            if (id_pt == "") {
                id_pt = token_pt;
            }
            else {
                value_pt = token_pt;
            }
        }
                pt_br[(boost::regex_replace(id_pt, boost::regex("\\\\n"), "\n"))] = (boost::regex_replace(value_pt, boost::regex("\\\\n"), "\n"));
    }
std::clog << "(done)." << std::endl;
/*std::clog << ">>>Loading PO_PO ... ";
std::ifstream input_po("po_po.loc");
    
    for (std::string line_po; getline(input_po, line_po);) {
        std::istringstream ss_po(line_po);
        std::string token_po;
        
        std::string id_po = "";
        std::string value_po = "";
        
        while (std::getline(ss_po, token_po, '@')) {
            if (id_po == "") {
                id_po = token_po;
            }
            else {
                value_po = token_po;
            }
        }
		    po_po[(boost::regex_replace(id_po, boost::regex("\\\\n"), "\n"))] = (boost::regex_replace(value_po, boost::regex("\\\\n"), "\n"));
    }   
   std::clog << "(done)." << std::endl; */
    languages[LANG_PT_BR] = &pt_br;
    // languages[LANG_PO_PO] = &po_po;
}

Localization::Localization()
{
    LoadLocalizations();
}

Localization::~Localization()
{
}
std::string Localization::t(LocalizationLang_t lang, std::string localString)
{
    if (lang != LANG_EN_US) {
        try {
            if ((*languages[lang]).count(localString)) {
                return (*languages[lang])[localString];
            }
        }
        catch(...) {}
    }
    return localString;
}
