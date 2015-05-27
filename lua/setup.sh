#!/bin/bash

function mercurial_get {
	if [ ! -d "$1" ]; then
		curl -L "$2" | tar -xvzf -
		mv $1-* $1
	fi
}

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "Install dir is: $DIR"

if [ ! -d "$DIR/luafilesystem" ]; then
	curl -L "https://github.com/keplerproject/luafilesystem/archive/v_1_6_3.tar.gz" | tar -xvzf -
	mv $DIR/luafilesystem-v_1_6_3 $DIR/luafilesystem
	(cd "$DIR/luafilesystem"; make)
fi

if [ ! -d "$DIR/gpc" ]; then
	curl -L "http://webserver2.tecgraf.puc-rio.br/~lhf/ftp/lua/5.2/lgpc.tar.gz" | tar -xvzf - 
	(cd "$DIR/gpc"; make CFLAGS=-fPIC so)
fi

mercurial_get "$DIR/doub-path" "https://bitbucket.org/doub/path/get/tip.tar.gz"

mercurial_get "$DIR/doub-luafreetype" "https://bitbucket.org/doub/luafreetype/get/tip.tar.gz"
(cd "$DIR/doub-luafreetype"; make)

mercurial_get "$DIR/doub-geometry" "https://bitbucket.org/doub/geometry/get/tip.tar.gz"

mercurial_get "$DIR/doub-xml" "https://bitbucket.org/doub/xml/get/tip.tar.gz"

mercurial_get "$DIR/doub-aperture-scripting" "http://hg.piratery.net/aperture-scripting/get/tip.tar.gz"
