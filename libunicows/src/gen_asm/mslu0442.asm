%include "dll_names.inc"

                    global __imp__RasSetEntryPropertiesW@24
                    global _RasSetEntryPropertiesW@24
                    global _Unicows_RasSetEntryPropertiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasSetEntryPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasSetEntryPropertiesW@24     ; place to save the pointer
                    push dword [_Unicows_RasSetEntryPropertiesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasSetEntryPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasSetEntryPropertiesW@24]

_RasSetEntryPropertiesW@24:
                    jmp [__imp__RasSetEntryPropertiesW@24]


                    section .data

__imp__RasSetEntryPropertiesW@24:   dd unicows_initial_stub_RasSetEntryPropertiesW
_Unicows_RasSetEntryPropertiesW:      dd 0
namestring_RasSetEntryPropertiesW:    db 'RasSetEntryPropertiesW',0
