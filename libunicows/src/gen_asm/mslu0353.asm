%include "dll_names.inc"

                    global __imp__GetPrivateProfileSectionW@16
                    global _GetPrivateProfileSectionW@16
                    global _Unicows_GetPrivateProfileSectionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetPrivateProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileSectionW@16     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetPrivateProfileSectionW@16]

_GetPrivateProfileSectionW@16:
                    jmp [__imp__GetPrivateProfileSectionW@16]


                    section .data

__imp__GetPrivateProfileSectionW@16:   dd unicows_initial_stub_GetPrivateProfileSectionW
_Unicows_GetPrivateProfileSectionW:      dd 0
namestring_GetPrivateProfileSectionW:    db 'GetPrivateProfileSectionW',0
