%include "dll_names.inc"

                    global __imp__CommConfigDialogW@12
                    global CommConfigDialogW
                    global _CommConfigDialogW@12
                    global _Unicows_CommConfigDialogW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CommConfigDialogW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CommConfigDialogW@12     ; place to save the pointer
                    push dword [_Unicows_CommConfigDialogW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_CommConfigDialogW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CommConfigDialogW:
_CommConfigDialogW@12:
                    jmp [__imp__CommConfigDialogW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CommConfigDialogW@12:   dd unicows_initial_stub_CommConfigDialogW
_Unicows_CommConfigDialogW:      dd 0
namestring_CommConfigDialogW:    db 'CommConfigDialogW',0
