%include "dll_names.inc"

                    global __imp__GetPrivateProfileSectionNamesW@12
                    global _GetPrivateProfileSectionNamesW@12
                    global _Unicows_GetPrivateProfileSectionNamesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrivateProfileSectionNamesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileSectionNamesW@12     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileSectionNamesW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileSectionNamesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrivateProfileSectionNamesW@12]

_GetPrivateProfileSectionNamesW@12:
                    jmp [__imp__GetPrivateProfileSectionNamesW@12]


                    section .data

__imp__GetPrivateProfileSectionNamesW@12:   dd unicows_initial_stub_GetPrivateProfileSectionNamesW
_Unicows_GetPrivateProfileSectionNamesW:      dd 0
namestring_GetPrivateProfileSectionNamesW:    db 'GetPrivateProfileSectionNamesW',0
