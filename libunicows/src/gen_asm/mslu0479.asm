%include "dll_names.inc"

                    global __imp__GetOpenFileNamePreviewW@4
                    global _GetOpenFileNamePreviewW@4
                    global _Unicows_GetOpenFileNamePreviewW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetOpenFileNamePreviewW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOpenFileNamePreviewW@4     ; place to save the pointer
                    push dword [_Unicows_GetOpenFileNamePreviewW]      ; default proc, if any
                    push dword MSVFW32                  ; dll id
                    push dword namestring_GetOpenFileNamePreviewW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetOpenFileNamePreviewW@4]

_GetOpenFileNamePreviewW@4:
                    jmp [__imp__GetOpenFileNamePreviewW@4]


                    section .data

__imp__GetOpenFileNamePreviewW@4:   dd unicows_initial_stub_GetOpenFileNamePreviewW
_Unicows_GetOpenFileNamePreviewW:      dd 0
namestring_GetOpenFileNamePreviewW:    db 'GetOpenFileNamePreviewW',0
