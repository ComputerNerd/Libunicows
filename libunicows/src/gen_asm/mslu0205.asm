%include "dll_names.inc"

                    global __imp__RegisterClipboardFormatW@4
                    global _RegisterClipboardFormatW@4
                    global _Unicows_RegisterClipboardFormatW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_RegisterClipboardFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterClipboardFormatW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterClipboardFormatW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterClipboardFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__RegisterClipboardFormatW@4]

_RegisterClipboardFormatW@4:
                    jmp [__imp__RegisterClipboardFormatW@4]


                    section .data

__imp__RegisterClipboardFormatW@4:   dd unicows_initial_stub_RegisterClipboardFormatW
_Unicows_RegisterClipboardFormatW:      dd 0
namestring_RegisterClipboardFormatW:    db 'RegisterClipboardFormatW',0
