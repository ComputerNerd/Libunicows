%include "dll_names.inc"

                    global __imp__GetProfileSectionW@12
                    global _GetProfileSectionW@12
                    global _Unicows_GetProfileSectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetProfileSectionW@12     ; place to save the pointer
                    push dword [_Unicows_GetProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetProfileSectionW@12]

_GetProfileSectionW@12:
                    jmp [__imp__GetProfileSectionW@12]


                    section .data

__imp__GetProfileSectionW@12:   dd unicows_initial_stub_GetProfileSectionW
_Unicows_GetProfileSectionW:      dd 0
namestring_GetProfileSectionW:    db 'GetProfileSectionW',0
