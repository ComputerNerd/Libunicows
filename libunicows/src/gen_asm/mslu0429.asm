%include "dll_names.inc"

                    global __imp__RasEnumEntriesW@20
                    global _RasEnumEntriesW@20
                    global _Unicows_RasEnumEntriesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasEnumEntriesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEnumEntriesW@20     ; place to save the pointer
                    push dword [_Unicows_RasEnumEntriesW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEnumEntriesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasEnumEntriesW@20]

_RasEnumEntriesW@20:
                    jmp [__imp__RasEnumEntriesW@20]


                    section .data

__imp__RasEnumEntriesW@20:   dd unicows_initial_stub_RasEnumEntriesW
_Unicows_RasEnumEntriesW:      dd 0
namestring_RasEnumEntriesW:    db 'RasEnumEntriesW',0
