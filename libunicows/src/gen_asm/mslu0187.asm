%include "dll_names.inc"

                    global __imp__LoadCursorFromFileW@4
                    global _LoadCursorFromFileW@4
                    global _Unicows_LoadCursorFromFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_LoadCursorFromFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadCursorFromFileW@4     ; place to save the pointer
                    push dword [_Unicows_LoadCursorFromFileW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadCursorFromFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__LoadCursorFromFileW@4]

_LoadCursorFromFileW@4:
                    jmp [__imp__LoadCursorFromFileW@4]


                    section .data

__imp__LoadCursorFromFileW@4:   dd unicows_initial_stub_LoadCursorFromFileW
_Unicows_LoadCursorFromFileW:      dd 0
namestring_LoadCursorFromFileW:    db 'LoadCursorFromFileW',0
