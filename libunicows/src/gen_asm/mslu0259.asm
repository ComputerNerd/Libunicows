%include "dll_names.inc"

                    global __imp__IsTextUnicode@12
                    global _IsTextUnicode@12
                    global _Unicows_IsTextUnicode
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsTextUnicode:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsTextUnicode@12     ; place to save the pointer
                    push dword [_Unicows_IsTextUnicode]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_IsTextUnicode      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsTextUnicode@12]

_IsTextUnicode@12:
                    jmp [__imp__IsTextUnicode@12]


                    section .data

__imp__IsTextUnicode@12:   dd unicows_initial_stub_IsTextUnicode
_Unicows_IsTextUnicode:      dd 0
namestring_IsTextUnicode:    db 'IsTextUnicode',0
