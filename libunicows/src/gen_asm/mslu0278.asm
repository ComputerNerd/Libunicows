%include "dll_names.inc"

                    global __imp__ChooseFontW@4
                    global _ChooseFontW@4
                    global _Unicows_ChooseFontW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_ChooseFontW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChooseFontW@4     ; place to save the pointer
                    push dword [_Unicows_ChooseFontW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_ChooseFontW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__ChooseFontW@4]

_ChooseFontW@4:
                    jmp [__imp__ChooseFontW@4]


                    section .data

__imp__ChooseFontW@4:   dd unicows_initial_stub_ChooseFontW
_Unicows_ChooseFontW:      dd 0
namestring_ChooseFontW:    db 'ChooseFontW',0
