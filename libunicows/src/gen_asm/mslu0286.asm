%include "dll_names.inc"

                    global __imp__PageSetupDlgW@4
                    global PageSetupDlgW
                    global _PageSetupDlgW@4
                    global _Unicows_PageSetupDlgW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_PageSetupDlgW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PageSetupDlgW@4     ; place to save the pointer
                    push dword [_Unicows_PageSetupDlgW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_PageSetupDlgW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

PageSetupDlgW:
_PageSetupDlgW@4:
                    jmp [__imp__PageSetupDlgW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__PageSetupDlgW@4:   dd unicows_initial_stub_PageSetupDlgW
_Unicows_PageSetupDlgW:      dd 0
namestring_PageSetupDlgW:    db 'PageSetupDlgW',0
