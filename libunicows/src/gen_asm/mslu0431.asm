%include "dll_names.inc"

                    global __imp__RasGetEntryDialParamsW@12
                    global _RasGetEntryDialParamsW@12
                    global _Unicows_RasGetEntryDialParamsW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasGetEntryDialParamsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetEntryDialParamsW@12     ; place to save the pointer
                    push dword [_Unicows_RasGetEntryDialParamsW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetEntryDialParamsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasGetEntryDialParamsW@12]

_RasGetEntryDialParamsW@12:
                    jmp [__imp__RasGetEntryDialParamsW@12]


                    section .data

__imp__RasGetEntryDialParamsW@12:   dd unicows_initial_stub_RasGetEntryDialParamsW
_Unicows_RasGetEntryDialParamsW:      dd 0
namestring_RasGetEntryDialParamsW:    db 'RasGetEntryDialParamsW',0
