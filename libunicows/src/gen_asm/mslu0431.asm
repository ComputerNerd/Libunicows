%include "dll_names.inc"

                    global __imp__RasEditPhonebookEntryW@12
                    global _RasEditPhonebookEntryW@12
                    global _Unicows_RasEditPhonebookEntryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasEditPhonebookEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEditPhonebookEntryW@12     ; place to save the pointer
                    push dword [_Unicows_RasEditPhonebookEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEditPhonebookEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasEditPhonebookEntryW@12]

_RasEditPhonebookEntryW@12:
                    jmp [__imp__RasEditPhonebookEntryW@12]


                    section .data

__imp__RasEditPhonebookEntryW@12:   dd unicows_initial_stub_RasEditPhonebookEntryW
_Unicows_RasEditPhonebookEntryW:      dd 0
namestring_RasEditPhonebookEntryW:    db 'RasEditPhonebookEntryW',0
