%include "dll_names.inc"

                    global __imp__FindTextW@4
                    global _FindTextW@4
                    global _Unicows_FindTextW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_FindTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindTextW@4     ; place to save the pointer
                    push dword [_Unicows_FindTextW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_FindTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__FindTextW@4]

_FindTextW@4:
                    jmp [__imp__FindTextW@4]


                    section .data

__imp__FindTextW@4:   dd unicows_initial_stub_FindTextW
_Unicows_FindTextW:      dd 0
namestring_FindTextW:    db 'FindTextW',0
