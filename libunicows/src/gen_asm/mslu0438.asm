%include "dll_names.inc"

                    global __imp__RasSetSubEntryPropertiesW@28
                    global _RasSetSubEntryPropertiesW@28
                    global _Unicows_RasSetSubEntryPropertiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasSetSubEntryPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasSetSubEntryPropertiesW@28     ; place to save the pointer
                    push dword [_Unicows_RasSetSubEntryPropertiesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasSetSubEntryPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasSetSubEntryPropertiesW@28]

_RasSetSubEntryPropertiesW@28:
                    jmp [__imp__RasSetSubEntryPropertiesW@28]


                    section .data

__imp__RasSetSubEntryPropertiesW@28:   dd unicows_initial_stub_RasSetSubEntryPropertiesW
_Unicows_RasSetSubEntryPropertiesW:      dd 0
namestring_RasSetSubEntryPropertiesW:    db 'RasSetSubEntryPropertiesW',0
