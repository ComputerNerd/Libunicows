%include "dll_names.inc"

                    global __imp__DlgDirListW@20
                    global _DlgDirListW@20
                    global _Unicows_DlgDirListW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DlgDirListW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DlgDirListW@20     ; place to save the pointer
                    push dword [_Unicows_DlgDirListW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DlgDirListW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DlgDirListW@20]

_DlgDirListW@20:
                    jmp [__imp__DlgDirListW@20]


                    section .data

__imp__DlgDirListW@20:   dd unicows_initial_stub_DlgDirListW
_Unicows_DlgDirListW:      dd 0
namestring_DlgDirListW:    db 'DlgDirListW',0
