%include "dll_names.inc"

                    global __imp__RasDeleteEntryW@8
                    global _RasDeleteEntryW@8
                    global _Unicows_RasDeleteEntryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasDeleteEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasDeleteEntryW@8     ; place to save the pointer
                    push dword [_Unicows_RasDeleteEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasDeleteEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasDeleteEntryW@8]

_RasDeleteEntryW@8:
                    jmp [__imp__RasDeleteEntryW@8]


                    section .data

__imp__RasDeleteEntryW@8:   dd unicows_initial_stub_RasDeleteEntryW
_Unicows_RasDeleteEntryW:      dd 0
namestring_RasDeleteEntryW:    db 'RasDeleteEntryW',0
