%include "dll_names.inc"

                    global __imp__GetClipboardFormatNameW@12
                    global _GetClipboardFormatNameW@12
                    global _Unicows_GetClipboardFormatNameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetClipboardFormatNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClipboardFormatNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetClipboardFormatNameW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClipboardFormatNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetClipboardFormatNameW@12]

_GetClipboardFormatNameW@12:
                    jmp [__imp__GetClipboardFormatNameW@12]


                    section .data

__imp__GetClipboardFormatNameW@12:   dd unicows_initial_stub_GetClipboardFormatNameW
_Unicows_GetClipboardFormatNameW:      dd 0
namestring_GetClipboardFormatNameW:    db 'GetClipboardFormatNameW',0
