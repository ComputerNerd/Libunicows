%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetLocaleInfoW@16
                    global GetLocaleInfoW
                    global _GetLocaleInfoW@16
                    global _Unicows_GetLocaleInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetLocaleInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetLocaleInfoW@16     ; place to save the pointer
                    push dword [_Unicows_GetLocaleInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetLocaleInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetLocaleInfoW:
_GetLocaleInfoW@16:
                    jmp [__imp__GetLocaleInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetLocaleInfoW@16:   dd unicows_initial_stub_GetLocaleInfoW
_Unicows_GetLocaleInfoW:      dd 0
namestring_GetLocaleInfoW:    db 'GetLocaleInfoW',0
