%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DlgDirListComboBoxW@20
                    global DlgDirListComboBoxW
                    global _DlgDirListComboBoxW@20
                    global _Unicows_DlgDirListComboBoxW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

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

                    ; ...and skip to it (see following jmp instruction):

DlgDirListComboBoxW:
_DlgDirListComboBoxW@20:
                    jmp [__imp__DlgDirListComboBoxW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DlgDirListComboBoxW@20:   dd unicows_initial_stub_DlgDirListComboBoxW
_Unicows_DlgDirListComboBoxW:      dd 0
namestring_DlgDirListComboBoxW:    db 'DlgDirListComboBoxW',0
