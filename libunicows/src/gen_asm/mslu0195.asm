%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__MapVirtualKeyExW@12
                    global MapVirtualKeyExW
                    global _MapVirtualKeyExW@12
                    global _Unicows_MapVirtualKeyExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MapVirtualKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MapVirtualKeyExW@12     ; place to save the pointer
                    push dword [_Unicows_MapVirtualKeyExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_MapVirtualKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MapVirtualKeyExW:
_MapVirtualKeyExW@12:
                    jmp [__imp__MapVirtualKeyExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MapVirtualKeyExW@12:   dd unicows_initial_stub_MapVirtualKeyExW
_Unicows_MapVirtualKeyExW:      dd 0
namestring_MapVirtualKeyExW:    db 'MapVirtualKeyExW',0
