%include "dll_names.inc"

                    global __imp__ShellExecuteExW@4
                    global ShellExecuteExW
                    global _ShellExecuteExW@4
                    global _Unicows_ShellExecuteExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ShellExecuteExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ShellExecuteExW@4     ; place to save the pointer
                    push dword [_Unicows_ShellExecuteExW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ShellExecuteExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ShellExecuteExW:
_ShellExecuteExW@4:
                    jmp [__imp__ShellExecuteExW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ShellExecuteExW@4:   dd unicows_initial_stub_ShellExecuteExW
_Unicows_ShellExecuteExW:      dd 0
namestring_ShellExecuteExW:    db 'ShellExecuteExW',0
