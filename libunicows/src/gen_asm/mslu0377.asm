%include "dll_names.inc"

                    global __imp__IsBadStringPtrW@8
                    global _IsBadStringPtrW@8
                    global _Unicows_IsBadStringPtrW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_IsBadStringPtrW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsBadStringPtrW@8     ; place to save the pointer
                    push dword [_Unicows_IsBadStringPtrW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_IsBadStringPtrW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__IsBadStringPtrW@8]

_IsBadStringPtrW@8:
                    jmp [__imp__IsBadStringPtrW@8]


                    section .data

__imp__IsBadStringPtrW@8:   dd unicows_initial_stub_IsBadStringPtrW
_Unicows_IsBadStringPtrW:      dd 0
namestring_IsBadStringPtrW:    db 'IsBadStringPtrW',0
