%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__VerLanguageNameW@12
                    global VerLanguageNameW
                    global _VerLanguageNameW@12
                    global _Unicows_VerLanguageNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_VerLanguageNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__VerLanguageNameW@12     ; place to save the pointer
                    push dword [_Unicows_VerLanguageNameW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_VerLanguageNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

VerLanguageNameW:
_VerLanguageNameW@12:
                    jmp [__imp__VerLanguageNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__VerLanguageNameW@12:   dd unicows_initial_stub_VerLanguageNameW
_Unicows_VerLanguageNameW:      dd 0
namestring_VerLanguageNameW:    db 'VerLanguageNameW',0
