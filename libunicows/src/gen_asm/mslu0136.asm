%include "dll_names.inc"

                    global __imp__DlgDirSelectExW@16
                    global _DlgDirSelectExW@16
                    global _Unicows_DlgDirSelectExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DlgDirSelectExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DlgDirSelectExW@16     ; place to save the pointer
                    push dword [_Unicows_DlgDirSelectExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DlgDirSelectExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DlgDirSelectExW@16]

_DlgDirSelectExW@16:
                    jmp [__imp__DlgDirSelectExW@16]


                    section .data

__imp__DlgDirSelectExW@16:   dd unicows_initial_stub_DlgDirSelectExW
_Unicows_DlgDirSelectExW:      dd 0
namestring_DlgDirSelectExW:    db 'DlgDirSelectExW',0
