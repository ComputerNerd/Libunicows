%include "dll_names.inc"

                    global __imp__InsertMenuItemW@16
                    global _InsertMenuItemW@16
                    global _Unicows_InsertMenuItemW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_InsertMenuItemW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__InsertMenuItemW@16     ; place to save the pointer
                    push dword [_Unicows_InsertMenuItemW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_InsertMenuItemW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__InsertMenuItemW@16]

_InsertMenuItemW@16:
                    jmp [__imp__InsertMenuItemW@16]


                    section .data

__imp__InsertMenuItemW@16:   dd unicows_initial_stub_InsertMenuItemW
_Unicows_InsertMenuItemW:      dd 0
namestring_InsertMenuItemW:    db 'InsertMenuItemW',0
