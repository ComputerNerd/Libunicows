%include "dll_names.inc"

                    global __imp__EnableWindow@8
                    global _EnableWindow@8
                    global _Unicows_EnableWindow
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnableWindow:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnableWindow@8     ; place to save the pointer
                    push dword [_Unicows_EnableWindow]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnableWindow      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnableWindow@8]

_EnableWindow@8:
                    jmp [__imp__EnableWindow@8]


                    section .data

__imp__EnableWindow@8:   dd unicows_initial_stub_EnableWindow
_Unicows_EnableWindow:      dd 0
namestring_EnableWindow:    db 'EnableWindow',0
