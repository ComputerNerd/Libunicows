%include "dll_names.inc"

                    global __imp__SetCalendarInfoW@16
                    global SetCalendarInfoW
                    global _SetCalendarInfoW@16
                    global _Unicows_SetCalendarInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetCalendarInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetCalendarInfoW@16     ; place to save the pointer
                    push dword [_Unicows_SetCalendarInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetCalendarInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetCalendarInfoW:
_SetCalendarInfoW@16:
                    jmp [__imp__SetCalendarInfoW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetCalendarInfoW@16:   dd unicows_initial_stub_SetCalendarInfoW
_Unicows_SetCalendarInfoW:      dd 0
namestring_SetCalendarInfoW:    db 'SetCalendarInfoW',0
