%include "dll_names.inc"

                    global __imp__GetTabbedTextExtentW@20
                    global _GetTabbedTextExtentW@20
                    global _Unicows_GetTabbedTextExtentW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetTabbedTextExtentW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTabbedTextExtentW@20     ; place to save the pointer
                    push dword [_Unicows_GetTabbedTextExtentW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetTabbedTextExtentW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetTabbedTextExtentW@20]

_GetTabbedTextExtentW@20:
                    jmp [__imp__GetTabbedTextExtentW@20]


                    section .data

__imp__GetTabbedTextExtentW@20:   dd unicows_initial_stub_GetTabbedTextExtentW
_Unicows_GetTabbedTextExtentW:      dd 0
namestring_GetTabbedTextExtentW:    db 'GetTabbedTextExtentW',0
