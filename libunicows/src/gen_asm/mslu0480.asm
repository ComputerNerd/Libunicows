%include "dll_names.inc"

                    global __imp__GetSaveFileNamePreviewW@4
                    global _GetSaveFileNamePreviewW@4
                    global _Unicows_GetSaveFileNamePreviewW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetSaveFileNamePreviewW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSaveFileNamePreviewW@4     ; place to save the pointer
                    push dword [_Unicows_GetSaveFileNamePreviewW]      ; default proc, if any
                    push dword MSVFW32                  ; dll id
                    push dword namestring_GetSaveFileNamePreviewW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetSaveFileNamePreviewW@4]

_GetSaveFileNamePreviewW@4:
                    jmp [__imp__GetSaveFileNamePreviewW@4]


                    section .data

__imp__GetSaveFileNamePreviewW@4:   dd unicows_initial_stub_GetSaveFileNamePreviewW
_Unicows_GetSaveFileNamePreviewW:      dd 0
namestring_GetSaveFileNamePreviewW:    db 'GetSaveFileNamePreviewW',0
