%include "dll_names.inc"

                    global __imp__WritePrivateProfileSectionW@12
                    global _WritePrivateProfileSectionW@12
                    global _Unicows_WritePrivateProfileSectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WritePrivateProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WritePrivateProfileSectionW@12     ; place to save the pointer
                    push dword [_Unicows_WritePrivateProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WritePrivateProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WritePrivateProfileSectionW@12]

_WritePrivateProfileSectionW@12:
                    jmp [__imp__WritePrivateProfileSectionW@12]


                    section .data

__imp__WritePrivateProfileSectionW@12:   dd unicows_initial_stub_WritePrivateProfileSectionW
_Unicows_WritePrivateProfileSectionW:      dd 0
namestring_WritePrivateProfileSectionW:    db 'WritePrivateProfileSectionW',0
