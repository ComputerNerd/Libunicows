%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__LoadLibraryExW@12
                    global LoadLibraryExW
                    global _LoadLibraryExW@12
                    global _Unicows_LoadLibraryExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadLibraryExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadLibraryExW@12     ; place to save the pointer
                    push dword [_Unicows_LoadLibraryExW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_LoadLibraryExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadLibraryExW:
_LoadLibraryExW@12:
                    jmp [__imp__LoadLibraryExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadLibraryExW@12:   dd unicows_initial_stub_LoadLibraryExW
_Unicows_LoadLibraryExW:      dd 0
namestring_LoadLibraryExW:    db 'LoadLibraryExW',0
