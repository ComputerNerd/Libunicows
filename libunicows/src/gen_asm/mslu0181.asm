%include "dll_names.inc"

                    global __imp__IsWindowUnicode@4
                    global _IsWindowUnicode@4
                    global _Unicows_IsWindowUnicode
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsWindowUnicode:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsWindowUnicode@4     ; place to save the pointer
                    push dword [_Unicows_IsWindowUnicode]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsWindowUnicode      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsWindowUnicode@4]

_IsWindowUnicode@4:
                    jmp [__imp__IsWindowUnicode@4]


                    section .data

__imp__IsWindowUnicode@4:   dd unicows_initial_stub_IsWindowUnicode
_Unicows_IsWindowUnicode:      dd 0
namestring_IsWindowUnicode:    db 'IsWindowUnicode',0
