%include "dll_names.inc"

                    global __imp__GetCalendarInfoW@24
                    global GetCalendarInfoW
                    global _GetCalendarInfoW@24
                    global _Unicows_GetCalendarInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCalendarInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCalendarInfoW@24     ; place to save the pointer
                    push dword [_Unicows_GetCalendarInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCalendarInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCalendarInfoW:
_GetCalendarInfoW@24:
                    jmp [__imp__GetCalendarInfoW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCalendarInfoW@24:   dd unicows_initial_stub_GetCalendarInfoW
_Unicows_GetCalendarInfoW:      dd 0
namestring_GetCalendarInfoW:    db 'GetCalendarInfoW',0
