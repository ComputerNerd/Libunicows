%include "dll_names.inc"

                    global __imp__GetCPInfo@8
                    global _GetCPInfo@8
                    global _Unicows_GetCPInfo
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCPInfo:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCPInfo@8     ; place to save the pointer
                    push dword [_Unicows_GetCPInfo]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetCPInfo      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCPInfo@8]

_GetCPInfo@8:
                    jmp [__imp__GetCPInfo@8]


                    section .data

__imp__GetCPInfo@8:   dd unicows_initial_stub_GetCPInfo
_Unicows_GetCPInfo:      dd 0
namestring_GetCPInfo:    db 'GetCPInfo',0
