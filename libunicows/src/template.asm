%include "dll_names.inc"

                    global __imp__NAME@SIZE
                    global _NAME@SIZE
                    global _Unicows_NAME
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_NAME:
                    ; Load the symbol...
                    pusha
                    push dword __imp__NAME@SIZE     ; place to save the pointer
                    push dword [_Unicows_NAME]      ; default proc, if any
                    push dword DLL                  ; dll id
                    push dword namestring_NAME      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__NAME@SIZE]

_NAME@SIZE:
                    jmp [__imp__NAME@SIZE]


                    section .data

__imp__NAME@SIZE:   dd unicows_initial_stub_NAME
_Unicows_NAME:      dd 0
namestring_NAME:    db 'NAME',0
