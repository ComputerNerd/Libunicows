%include "dll_names.inc"

                    global __imp__FreeContextBuffer@4
                    global _FreeContextBuffer@4
                    global _Unicows_FreeContextBuffer
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FreeContextBuffer:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FreeContextBuffer@4     ; place to save the pointer
                    push dword [_Unicows_FreeContextBuffer]      ; default proc, if any
                    push dword SECUR32                  ; dll id
                    push dword namestring_FreeContextBuffer      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FreeContextBuffer@4]

_FreeContextBuffer@4:
                    jmp [__imp__FreeContextBuffer@4]


                    section .data

__imp__FreeContextBuffer@4:   dd unicows_initial_stub_FreeContextBuffer
_Unicows_FreeContextBuffer:      dd 0
namestring_FreeContextBuffer:    db 'FreeContextBuffer',0