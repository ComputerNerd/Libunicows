%include "dll_names.inc"

                    global __imp__RasSetEntryDialParamsW@12
                    global _RasSetEntryDialParamsW@12
                    global _Unicows_RasSetEntryDialParamsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasSetEntryDialParamsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasSetEntryDialParamsW@12     ; place to save the pointer
                    push dword [_Unicows_RasSetEntryDialParamsW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasSetEntryDialParamsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasSetEntryDialParamsW@12]

_RasSetEntryDialParamsW@12:
                    jmp [__imp__RasSetEntryDialParamsW@12]


                    section .data

__imp__RasSetEntryDialParamsW@12:   dd unicows_initial_stub_RasSetEntryDialParamsW
_Unicows_RasSetEntryDialParamsW:      dd 0
namestring_RasSetEntryDialParamsW:    db 'RasSetEntryDialParamsW',0
