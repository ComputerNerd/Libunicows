%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DlgDirSelectExW@16
                    global DlgDirSelectExW
                    global _DlgDirSelectExW@16
                    global _Unicows_DlgDirSelectExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DlgDirSelectExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DlgDirSelectExW@16     ; place to save the pointer
                    push dword [_Unicows_DlgDirSelectExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DlgDirSelectExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DlgDirSelectExW:
_DlgDirSelectExW@16:
                    jmp [__imp__DlgDirSelectExW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DlgDirSelectExW@16:   dd unicows_initial_stub_DlgDirSelectExW
_Unicows_DlgDirSelectExW:      dd 0
namestring_DlgDirSelectExW:    db 'DlgDirSelectExW',0
