%include "dll_names.inc"

                    global __imp__EnumClipboardFormats@4
                    global _EnumClipboardFormats@4
                    global _Unicows_EnumClipboardFormats
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumClipboardFormats:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumClipboardFormats@4     ; place to save the pointer
                    push dword [_Unicows_EnumClipboardFormats]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumClipboardFormats      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumClipboardFormats@4]

_EnumClipboardFormats@4:
                    jmp [__imp__EnumClipboardFormats@4]


                    section .data

__imp__EnumClipboardFormats@4:   dd unicows_initial_stub_EnumClipboardFormats
_Unicows_EnumClipboardFormats:      dd 0
namestring_EnumClipboardFormats:    db 'EnumClipboardFormats',0
