#!/bin/sh

VERSION=0.6.1
NAME=libunicows


make_zip()
{
  D=_dist_$1
  DIRNAME=$NAME-$VERSION-$1
  ZIP=$NAME-$VERSION-$1.zip

  mkdir -p $D/$DIRNAME
  cp -f docs/*.txt docs/*.html lib/$1/* $D/$DIRNAME
  if [ "x$2" == "xwrapper" ]; then
      cp -f lib/unicows_wrapper.dll $D/$DIRNAME
  fi
  crlf -d $D/$DIRNAME/*.txt
  rm -f $ZIP
  (cd $D ; zip -9 -r ../$ZIP $DIRNAME)
  rm -rf $D
}

make_src()
{
  mkdir -p _dist/$NAME-$VERSION/lib/{msvc6,mingw32,bcc32}
  cp -Rf test docs src *.py *.sh *.txt  _dist/$NAME-$VERSION

  rm -f $NAME-$VERSION-src.tar.gz
  (cd _dist ; tar czvf ../$NAME-$VERSION-src.tar.gz $NAME-$VERSION)
    
  rm -rf _dist
}


make_zip mingw32
make_zip msvc6
make_zip bcc32 wrapper
make_src
