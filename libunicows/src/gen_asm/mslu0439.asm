%include "dll_names.inc"

                    global __imp__RasValidateEntryNameW@8
                    global _RasValidateEntryNameW@8
                    global _Unicows_RasValidateEntryNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RasValidateEntryNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasValidateEntryNameW@8     ; place to save the pointer
                    push dword [_Unicows_RasValidateEntryNameW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasValidateEntryNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RasValidateEntryNameW@8]

_RasValidateEntryNameW@8:
                    jmp [__imp__RasValidateEntryNameW@8]


                    section .data

__imp__RasValidateEntryNameW@8:   dd unicows_initial_stub_RasValidateEntryNameW
_Unicows_RasValidateEntryNameW:      dd 0
namestring_RasValidateEntryNameW:    db 'RasValidateEntryNameW',0
