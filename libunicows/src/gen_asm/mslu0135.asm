%include "dll_names.inc"

                    global __imp__DlgDirListComboBoxW@20
                    global _DlgDirListComboBoxW@20
                    global _Unicows_DlgDirListComboBoxW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DlgDirListComboBoxW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DlgDirListComboBoxW@20     ; place to save the pointer
                    push dword [_Unicows_DlgDirListComboBoxW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DlgDirListComboBoxW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DlgDirListComboBoxW@20]

_DlgDirListComboBoxW@20:
                    jmp [__imp__DlgDirListComboBoxW@20]


                    section .data

__imp__DlgDirListComboBoxW@20:   dd unicows_initial_stub_DlgDirListComboBoxW
_Unicows_DlgDirListComboBoxW:      dd 0
namestring_DlgDirListComboBoxW:    db 'DlgDirListComboBoxW',0
