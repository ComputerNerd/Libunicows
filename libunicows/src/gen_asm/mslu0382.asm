%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetTimeFormatW@24
                    global GetTimeFormatW
                    global _GetTimeFormatW@24
                    global _Unicows_GetTimeFormatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTimeFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTimeFormatW@24     ; place to save the pointer
                    push dword [_Unicows_GetTimeFormatW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetTimeFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTimeFormatW:
_GetTimeFormatW@24:
                    jmp [__imp__GetTimeFormatW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTimeFormatW@24:   dd unicows_initial_stub_GetTimeFormatW
_Unicows_GetTimeFormatW:      dd 0
namestring_GetTimeFormatW:    db 'GetTimeFormatW',0
