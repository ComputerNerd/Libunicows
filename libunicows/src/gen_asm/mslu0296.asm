%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__PrintDlgW@4
                    global PrintDlgW
                    global _PrintDlgW@4
                    global _Unicows_PrintDlgW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_PrintDlgW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__PrintDlgW@4     ; place to save the pointer
                    push dword [_Unicows_PrintDlgW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_PrintDlgW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

PrintDlgW:
_PrintDlgW@4:
                    jmp [__imp__PrintDlgW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__PrintDlgW@4:   dd unicows_initial_stub_PrintDlgW
_Unicows_PrintDlgW:      dd 0
namestring_PrintDlgW:    db 'PrintDlgW',0
