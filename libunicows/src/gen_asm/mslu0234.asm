%include "dll_names.inc"

                    global __imp__DragQueryFileW@16
                    global _DragQueryFileW@16
                    global _Unicows_DragQueryFileW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DragQueryFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DragQueryFileW@16     ; place to save the pointer
                    push dword [_Unicows_DragQueryFileW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_DragQueryFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DragQueryFileW@16]

_DragQueryFileW@16:
                    jmp [__imp__DragQueryFileW@16]


                    section .data

__imp__DragQueryFileW@16:   dd unicows_initial_stub_DragQueryFileW
_Unicows_DragQueryFileW:      dd 0
namestring_DragQueryFileW:    db 'DragQueryFileW',0
