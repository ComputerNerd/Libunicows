%include "dll_names.inc"

                    global __imp__GetFileVersionInfoSizeW@8
                    global _GetFileVersionInfoSizeW@8
                    global _Unicows_GetFileVersionInfoSizeW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetFileVersionInfoSizeW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFileVersionInfoSizeW@8     ; place to save the pointer
                    push dword [_Unicows_GetFileVersionInfoSizeW]      ; default proc, if any
                    push dword VERSION                  ; dll id
                    push dword namestring_GetFileVersionInfoSizeW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetFileVersionInfoSizeW@8]

_GetFileVersionInfoSizeW@8:
                    jmp [__imp__GetFileVersionInfoSizeW@8]


                    section .data

__imp__GetFileVersionInfoSizeW@8:   dd unicows_initial_stub_GetFileVersionInfoSizeW
_Unicows_GetFileVersionInfoSizeW:      dd 0
namestring_GetFileVersionInfoSizeW:    db 'GetFileVersionInfoSizeW',0
