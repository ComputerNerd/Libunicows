%include "dll_names.inc"

                    global __imp__GetClipboardData@4
                    global _GetClipboardData@4
                    global _Unicows_GetClipboardData
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClipboardData:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClipboardData@4     ; place to save the pointer
                    push dword [_Unicows_GetClipboardData]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClipboardData      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClipboardData@4]

_GetClipboardData@4:
                    jmp [__imp__GetClipboardData@4]


                    section .data

__imp__GetClipboardData@4:   dd unicows_initial_stub_GetClipboardData
_Unicows_GetClipboardData:      dd 0
namestring_GetClipboardData:    db 'GetClipboardData',0
