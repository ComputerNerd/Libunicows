cl /Fetest_vc6.exe /D UNICODE /D _UNICODE test.cpp unicows.lib kernel32.lib user32.lib gdi32.lib /link /libpath:..\lib\msvc6
del test.obj
