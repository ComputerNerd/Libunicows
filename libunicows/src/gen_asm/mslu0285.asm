%include "dll_names.inc"

                    global __imp__GetSaveFileNameW@4
                    global _GetSaveFileNameW@4
                    global _Unicows_GetSaveFileNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetSaveFileNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetSaveFileNameW@4     ; place to save the pointer
                    push dword [_Unicows_GetSaveFileNameW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_GetSaveFileNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetSaveFileNameW@4]

_GetSaveFileNameW@4:
                    jmp [__imp__GetSaveFileNameW@4]


                    section .data

__imp__GetSaveFileNameW@4:   dd unicows_initial_stub_GetSaveFileNameW
_Unicows_GetSaveFileNameW:      dd 0
namestring_GetSaveFileNameW:    db 'GetSaveFileNameW',0
