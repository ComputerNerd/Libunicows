%include "dll_names.inc"

                    global __imp__RasCreatePhonebookEntryW@8
                    global _RasCreatePhonebookEntryW@8
                    global _Unicows_RasCreatePhonebookEntryW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasCreatePhonebookEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasCreatePhonebookEntryW@8     ; place to save the pointer
                    push dword [_Unicows_RasCreatePhonebookEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasCreatePhonebookEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasCreatePhonebookEntryW@8]

_RasCreatePhonebookEntryW@8:
                    jmp [__imp__RasCreatePhonebookEntryW@8]


                    section .data

__imp__RasCreatePhonebookEntryW@8:   dd unicows_initial_stub_RasCreatePhonebookEntryW
_Unicows_RasCreatePhonebookEntryW:      dd 0
namestring_RasCreatePhonebookEntryW:    db 'RasCreatePhonebookEntryW',0
