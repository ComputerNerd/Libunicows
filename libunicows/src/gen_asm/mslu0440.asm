%include "dll_names.inc"

                    global __imp__RasRenameEntryW@12
                    global _RasRenameEntryW@12
                    global _Unicows_RasRenameEntryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasRenameEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasRenameEntryW@12     ; place to save the pointer
                    push dword [_Unicows_RasRenameEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasRenameEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasRenameEntryW@12]

_RasRenameEntryW@12:
                    jmp [__imp__RasRenameEntryW@12]


                    section .data

__imp__RasRenameEntryW@12:   dd unicows_initial_stub_RasRenameEntryW
_Unicows_RasRenameEntryW:      dd 0
namestring_RasRenameEntryW:    db 'RasRenameEntryW',0
