%include "dll_names.inc"

                    global __imp__OleUIPromptUserW
                    global _OleUIPromptUserW
                    global _Unicows_OleUIPromptUserW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_OleUIPromptUserW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIPromptUserW     ; place to save the pointer
                    push dword [_Unicows_OleUIPromptUserW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIPromptUserW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__OleUIPromptUserW]

_OleUIPromptUserW:
                    jmp [__imp__OleUIPromptUserW]


                    section .data

__imp__OleUIPromptUserW:   dd unicows_initial_stub_OleUIPromptUserW
_Unicows_OleUIPromptUserW:      dd 0
namestring_OleUIPromptUserW:    db 'OleUIPromptUserW',0
