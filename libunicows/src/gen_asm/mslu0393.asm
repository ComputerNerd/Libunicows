%include "dll_names.inc"

                    global __imp__ScrollConsoleScreenBufferW@20
                    global _ScrollConsoleScreenBufferW@20
                    global _Unicows_ScrollConsoleScreenBufferW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ScrollConsoleScreenBufferW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ScrollConsoleScreenBufferW@20     ; place to save the pointer
                    push dword [_Unicows_ScrollConsoleScreenBufferW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_ScrollConsoleScreenBufferW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ScrollConsoleScreenBufferW@20]

_ScrollConsoleScreenBufferW@20:
                    jmp [__imp__ScrollConsoleScreenBufferW@20]


                    section .data

__imp__ScrollConsoleScreenBufferW@20:   dd unicows_initial_stub_ScrollConsoleScreenBufferW
_Unicows_ScrollConsoleScreenBufferW:      dd 0
namestring_ScrollConsoleScreenBufferW:    db 'ScrollConsoleScreenBufferW',0