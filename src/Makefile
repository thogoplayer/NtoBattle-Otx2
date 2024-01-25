BIN = theotxserver

#-- If you installed the required libs on a different folder, change it here --#
INCLUDE = 	-I"/usr/include/libxml2"				-I"/usr/include/lua5.1"				-I"/usr/include/mysql" \
				-I"/usr/include/sqlite3" 				-I"/usr/include/boost"

#-- Type of the compiler, clang is also an option--#
CXX = g++

#-- Folder in which the compiled files '.o' will be stored --#
OBJDIR = objects


CXXOBJECTS = $(CXXSOURCES:%.cpp=$(OBJDIR)/%.o)

#-- FLAGS used in the source --#
FLAGS = -D_REENTRANT -DBOOST_DISABLE_ASSERTS -DNDEBUG -D__USE_MYSQL__ -D__ROOT_PERMISSION__


CXXFLAGS =	-pipe								-march=native				-mtune=native \
					$(INCLUDE) 					$(FLAGS)					-Wall \
					-Wno-maybe-uninitialized 	-Ofast 						-std=c++11 \
					-pthread 						-fno-strict-aliasing


#-- You may need to change the path of 'libtcmalloc_minimal' to the correct one for your distribution --#
#-- For Ubuntu 20 on WSL2 the path is /usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4 --#
LDFLAGS =		/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4 \
					-llua5.1				-lxml2						-lboost_thread \
					-lboost_system 	-lboost_filesystem		-lgmp \
					-lmysqlclient		-lboost_regex				-lcrypto \
					-lsqlite3				-g

# SQLITE: databasesqlite.cpp	MYSQL: databasemysql.cpp
# MYSQLPP: databasemysqlpp.cpp		PGSQL: databasepgsql.cpp
DATABASE = databasemysql.cpp


# For LOGIN_SERVER, add gameservers.cpp gameservers.h
# For OT_ADMIN, add admin.cpp admin.h
EXTRASOURCES =

CXXSOURCES = actions.cpp        cylinder.cpp     inputbox.cpp        monster.cpp         protocol.cpp       status.cpp \
	admin.cpp          database.cpp  databasemanager.cpp   ioban.cpp           monsters.cpp        protocolgame.cpp   talkaction.cpp \
	allocator.cpp      depot.cpp        ioguild.cpp         localization.cpp        movement.cpp        protocolhttp.cpp   teleport.cpp \
	baseevents.cpp     dispatcher.cpp   iologindata.cpp     networkmessage.cpp  protocollogin.cpp  textlogger.cpp \
	beds.cpp           exception.cpp    iomap.cpp           npc.cpp             protocolold.cpp    thing.cpp \
	chat.cpp           fileloader.cpp   iomapserialize.cpp  otpch.cpp           quests.cpp         tile.cpp \
	combat.cpp         game.cpp         itemattributes.cpp  otserv.cpp          raids.cpp          tools.cpp \
	condition.cpp      gameservers.cpp  item.cpp            outfit.cpp          scheduler.cpp      trashholder.cpp \
	configmanager.cpp  globalevent.cpp  items.cpp           outputmessage.cpp   scriptmanager.cpp  vocation.cpp \
	connection.cpp     group.cpp        luascript.cpp       party.cpp           server.cpp         waitlist.cpp \
	container.cpp      gui.cpp          mailbox.cpp         playerbox.cpp       spawn.cpp          weapons.cpp \
	creature.cpp       house.cpp        manager.cpp         player.cpp          spectators.cpp \
	auras.cpp 			wings.cpp		shaders.cpp			healthbars.cpp\
	creatureevent.cpp  housetile.cpp    map.cpp             position.cpp        spells.cpp rsa.cpp

all: $(BIN)

clean:
	$(RM) $(CXXOBJECTS) $(BIN)

$(BIN): $(CXXOBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(CXXOBJECTS) $(LDFLAGS)

$(OBJDIR)/%.o: %.cpp
	@echo [CC] $@
	@$(CXX) -c $(CXXFLAGS) -o $@ $<
