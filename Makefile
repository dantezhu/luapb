.PHONY: all  clean 

# Flags
CFLAGS =-g -Wall -fpic
LDFLAGS = -shared

CC?=gcc
CXX?=g++
LD?=gcc

# Directories
LUA_INC_DIR ?= /usr/include/lua5.1
PROTOBUF_INC_DIR ?=/usr/local/include
# Files
LIB = luapb.so

all:
	$(CXX) $(CFLAGS) -c -Iluapb -I$(LUA_INC_DIR) -I$(PROTOBUF_INC_DIR) luapb/*.cc
	$(CXX) $(LDFLAGS) -o $(LIB) *.o -L/usr/local/lib -lprotobuf  -llua

clean:
	rm -f *.so
	rm -f *.o
