%include "dll_names.inc"

                    global __imp__WideCharToMultiByte@32
                    global _WideCharToMultiByte@32
                    global _Unicows_WideCharToMultiByte
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_WideCharToMultiByte:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WideCharToMultiByte@32     ; place to save the pointer
                    push dword [_Unicows_WideCharToMultiByte]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WideCharToMultiByte      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__WideCharToMultiByte@32]

_WideCharToMultiByte@32:
                    jmp [__imp__WideCharToMultiByte@32]


                    section .data

__imp__WideCharToMultiByte@32:   dd unicows_initial_stub_WideCharToMultiByte
_Unicows_WideCharToMultiByte:      dd 0
namestring_WideCharToMultiByte:    db 'WideCharToMultiByte',0
