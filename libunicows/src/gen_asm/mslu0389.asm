%include "dll_names.inc"

                    global __imp__OutputDebugStringW@4
                    global _OutputDebugStringW@4
                    global _Unicows_OutputDebugStringW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OutputDebugStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OutputDebugStringW@4     ; place to save the pointer
                    push dword [_Unicows_OutputDebugStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_OutputDebugStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OutputDebugStringW@4]

_OutputDebugStringW@4:
                    jmp [__imp__OutputDebugStringW@4]


                    section .data

__imp__OutputDebugStringW@4:   dd unicows_initial_stub_OutputDebugStringW
_Unicows_OutputDebugStringW:      dd 0
namestring_OutputDebugStringW:    db 'OutputDebugStringW',0
