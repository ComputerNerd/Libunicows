%include "dll_names.inc"

                    global __imp__mmioInstallIOProcW@12
                    global _mmioInstallIOProcW@12
                    global _Unicows_mmioInstallIOProcW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mmioInstallIOProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioInstallIOProcW@12     ; place to save the pointer
                    push dword [_Unicows_mmioInstallIOProcW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioInstallIOProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mmioInstallIOProcW@12]

_mmioInstallIOProcW@12:
                    jmp [__imp__mmioInstallIOProcW@12]


                    section .data

__imp__mmioInstallIOProcW@12:   dd unicows_initial_stub_mmioInstallIOProcW
_Unicows_mmioInstallIOProcW:      dd 0
namestring_mmioInstallIOProcW:    db 'mmioInstallIOProcW',0
