%include "dll_names.inc"

                    global __imp__RasGetEntryPropertiesW@24
                    global _RasGetEntryPropertiesW@24
                    global _Unicows_RasGetEntryPropertiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasGetEntryPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasGetEntryPropertiesW@24     ; place to save the pointer
                    push dword [_Unicows_RasGetEntryPropertiesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasGetEntryPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasGetEntryPropertiesW@24]

_RasGetEntryPropertiesW@24:
                    jmp [__imp__RasGetEntryPropertiesW@24]


                    section .data

__imp__RasGetEntryPropertiesW@24:   dd unicows_initial_stub_RasGetEntryPropertiesW
_Unicows_RasGetEntryPropertiesW:      dd 0
namestring_RasGetEntryPropertiesW:    db 'RasGetEntryPropertiesW',0
