%include "dll_names.inc"

                    global __imp__DefFrameProcW@20
                    global _DefFrameProcW@20
                    global _Unicows_DefFrameProcW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DefFrameProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefFrameProcW@20     ; place to save the pointer
                    push dword [_Unicows_DefFrameProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefFrameProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DefFrameProcW@20]

_DefFrameProcW@20:
                    jmp [__imp__DefFrameProcW@20]


                    section .data

__imp__DefFrameProcW@20:   dd unicows_initial_stub_DefFrameProcW
_Unicows_DefFrameProcW:      dd 0
namestring_DefFrameProcW:    db 'DefFrameProcW',0
