%include "dll_names.inc"

                    global __imp__DlgDirSelectComboBoxExW@16
                    global _DlgDirSelectComboBoxExW@16
                    global _Unicows_DlgDirSelectComboBoxExW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_DlgDirSelectComboBoxExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DlgDirSelectComboBoxExW@16     ; place to save the pointer
                    push dword [_Unicows_DlgDirSelectComboBoxExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DlgDirSelectComboBoxExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__DlgDirSelectComboBoxExW@16]

_DlgDirSelectComboBoxExW@16:
                    jmp [__imp__DlgDirSelectComboBoxExW@16]


                    section .data

__imp__DlgDirSelectComboBoxExW@16:   dd unicows_initial_stub_DlgDirSelectComboBoxExW
_Unicows_DlgDirSelectComboBoxExW:      dd 0
namestring_DlgDirSelectComboBoxExW:    db 'DlgDirSelectComboBoxExW',0
