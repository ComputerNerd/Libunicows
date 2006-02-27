# using WMAKE
CC=wcc386
NASM=nasmw
LIB=wlib

LIBPATH=..\lib\watcom
LIBTARGET=$(LIBPATH)\libunicows.lib
LIBTARGET_COMPAT=$(LIBPATH)\unicows.lib

all: build\watcom $(LIBPATH) $(LIBTARGET) $(LIBTARGET_COMPAT)

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

LIBOBJECTS = $(WRAPPERS) &
             build\watcom\unicows_import.obj &
             build\watcom\unicows_vars0.obj &
             build\watcom\unicows_mutex.obj

RESPONSFILE= build\watcom\unicows.~ln

$(LIBTARGET): $(LIBOBJECTS) build\watcom\unicows.~ln
        $(LIB) -b -c -n $(LIBTARGET) @$(RESPONSFILE)

$(RESPONSFILE): $(LIBOBJECTS)
        %create $^@
        for %i in ($(LIBOBJECTS)) do %append $^@ + %i

$(LIBTARGET_COMPAT): $(LIBTARGET)
    copy $(LIBTARGET) $(LIBTARGET_COMPAT)

clean:
    -del build\watcom\*.obj
    -del $(RESPONSFILE)
    -del $(LIBTARGET)
