%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__mmioInstallIOProcW@12
                    global mmioInstallIOProcW
                    global _mmioInstallIOProcW@12
                    global _Unicows_mmioInstallIOProcW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mmioInstallIOProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mmioInstallIOProcW@12     ; place to save the pointer
                    push dword [_Unicows_mmioInstallIOProcW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mmioInstallIOProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mmioInstallIOProcW:
_mmioInstallIOProcW@12:
                    jmp [__imp__mmioInstallIOProcW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mmioInstallIOProcW@12:   dd unicows_initial_stub_mmioInstallIOProcW
_Unicows_mmioInstallIOProcW:      dd 0
namestring_mmioInstallIOProcW:    db 'mmioInstallIOProcW',0
