%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__FindNextFileW@8
                    global FindNextFileW
                    global _FindNextFileW@8
                    global _Unicows_FindNextFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindNextFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindNextFileW@8     ; place to save the pointer
                    push dword [_Unicows_FindNextFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindNextFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindNextFileW:
_FindNextFileW@8:
                    jmp [__imp__FindNextFileW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindNextFileW@8:   dd unicows_initial_stub_FindNextFileW
_Unicows_FindNextFileW:      dd 0
namestring_FindNextFileW:    db 'FindNextFileW',0
