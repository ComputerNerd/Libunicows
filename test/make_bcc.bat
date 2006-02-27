bcc32 -c -W -WU -DUNICODE test.cpp
ilink32 -Gn -L..\lib\bcc32 -aa -Tpe test c0w32,test_bcc,,unicows import32 cw32
del *.obj
del *.tds
del *.map
