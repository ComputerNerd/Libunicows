%include "dll_names.inc"

                    global __imp__ShellAboutW@16
                    global _ShellAboutW@16
                    global _Unicows_ShellAboutW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ShellAboutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ShellAboutW@16     ; place to save the pointer
                    push dword [_Unicows_ShellAboutW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ShellAboutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ShellAboutW@16]

_ShellAboutW@16:
                    jmp [__imp__ShellAboutW@16]


                    section .data

__imp__ShellAboutW@16:   dd unicows_initial_stub_ShellAboutW
_Unicows_ShellAboutW:      dd 0
namestring_ShellAboutW:    db 'ShellAboutW',0
