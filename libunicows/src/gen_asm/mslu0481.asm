%include "dll_names.inc"

                    global __imp__MCIWndCreateW
                    global _MCIWndCreateW
                    global _Unicows_MCIWndCreateW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_MCIWndCreateW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MCIWndCreateW     ; place to save the pointer
                    push dword [_Unicows_MCIWndCreateW]      ; default proc, if any
                    push dword MSVFW32                  ; dll id
                    push dword namestring_MCIWndCreateW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__MCIWndCreateW]

_MCIWndCreateW:
                    jmp [__imp__MCIWndCreateW]


                    section .data

__imp__MCIWndCreateW:   dd unicows_initial_stub_MCIWndCreateW
_Unicows_MCIWndCreateW:      dd 0
namestring_MCIWndCreateW:    db 'MCIWndCreateW',0
