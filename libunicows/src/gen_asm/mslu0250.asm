%include "dll_names.inc"

                    global __imp__Shell_NotifyIconW@8
                    global _Shell_NotifyIconW@8
                    global _Unicows_Shell_NotifyIconW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_Shell_NotifyIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__Shell_NotifyIconW@8     ; place to save the pointer
                    push dword [_Unicows_Shell_NotifyIconW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_Shell_NotifyIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__Shell_NotifyIconW@8]

_Shell_NotifyIconW@8:
                    jmp [__imp__Shell_NotifyIconW@8]


                    section .data

__imp__Shell_NotifyIconW@8:   dd unicows_initial_stub_Shell_NotifyIconW
_Unicows_Shell_NotifyIconW:      dd 0
namestring_Shell_NotifyIconW:    db 'Shell_NotifyIconW',0
