# using WMAKE
CC=wcc386
NASM=nasmw
LIB=wlib

LIBPATH=..\lib\watcom
LIBTARGET=$(LIBPATH)\unicows.lib

all: build\watcom $(LIBPATH) $(LIBTARGET)

!include "makefile.wat.include"

{}.c{build\watcom}.obj:
	$(CC) -fo=$@ $<

{gen_asm}.asm{build\watcom}.obj:
	$(NASM) -f win32 -o $@ $<

{}.asm{build\watcom}.obj:
	$(NASM) -f win32 -o $@ $<

build\watcom:
    if not exist .\build\watcom mkdir .\build\watcom

$(LIBPATH):
    if not exist .\$(LIBPATH) mkdir .$(LIBPATH)

LIBOBJECTS = $(WRAPPERS) build\watcom\unicows_import.obj
RESPONSFILE= build\watcom\unicows.~ln
$(LIBTARGET): $(LIBOBJECTS) build\watcom\unicows.~ln
        $(LIB) -b -c -n $(LIBTARGET) @$(RESPONSFILE)

$(RESPONSFILE): $(LIBOBJECTS)
        %create $^@
        for %i in ($(LIBOBJECTS)) do %append $^@ + %i

clean:
    -del build\watcom\*.obj
    -del $(RESPONSFILE)
    -del $(LIBTARGET)
