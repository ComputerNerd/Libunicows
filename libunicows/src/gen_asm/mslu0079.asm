%include "dll_names.inc"

                    global __imp__mmioRenameW@16
                    global _mmioRenameW@16
                    global _Unicows_mmioRenameW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_mmioRenameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioRenameW@16     ; place to save the pointer
                    push dword [_Unicows_mmioRenameW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioRenameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__mmioRenameW@16]

_mmioRenameW@16:
                    jmp [__imp__mmioRenameW@16]


                    section .data

__imp__mmioRenameW@16:   dd unicows_initial_stub_mmioRenameW
_Unicows_mmioRenameW:      dd 0
namestring_mmioRenameW:    db 'mmioRenameW',0
