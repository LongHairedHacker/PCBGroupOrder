#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "Lua library dir is: $DIR"

export LUA_PATH="?/?.lua;?.lua;$DIR/doub-aperture-scripting/?.lua;$DIR/doub-?/?.lua;$DIR/doub-geometry/lua_module/?.lua"
export LUA_CPATH="$DIR/luafilesystem/src/?.so;$DIR/gpc/?.so;$DIR/doub-luafreetype/?.so"
