%include "dll_names.inc"

                    global __imp__GetEnhMetaFileDescriptionW@12
                    global _GetEnhMetaFileDescriptionW@12
                    global _Unicows_GetEnhMetaFileDescriptionW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetEnhMetaFileDescriptionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetEnhMetaFileDescriptionW@12     ; place to save the pointer
                    push dword [_Unicows_GetEnhMetaFileDescriptionW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetEnhMetaFileDescriptionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetEnhMetaFileDescriptionW@12]

_GetEnhMetaFileDescriptionW@12:
                    jmp [__imp__GetEnhMetaFileDescriptionW@12]


                    section .data

__imp__GetEnhMetaFileDescriptionW@12:   dd unicows_initial_stub_GetEnhMetaFileDescriptionW
_Unicows_GetEnhMetaFileDescriptionW:      dd 0
namestring_GetEnhMetaFileDescriptionW:    db 'GetEnhMetaFileDescriptionW',0