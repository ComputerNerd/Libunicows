%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__FindWindowExW@16
                    global FindWindowExW
                    global _FindWindowExW@16
                    global _Unicows_FindWindowExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindWindowExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindWindowExW@16     ; place to save the pointer
                    push dword [_Unicows_FindWindowExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_FindWindowExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindWindowExW:
_FindWindowExW@16:
                    jmp [__imp__FindWindowExW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindWindowExW@16:   dd unicows_initial_stub_FindWindowExW
_Unicows_FindWindowExW:      dd 0
namestring_FindWindowExW:    db 'FindWindowExW',0
