%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ShellAboutW@16
                    global ShellAboutW
                    global _ShellAboutW@16
                    global _Unicows_ShellAboutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ShellAboutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ShellAboutW@16     ; place to save the pointer
                    push dword [_Unicows_ShellAboutW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ShellAboutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ShellAboutW:
_ShellAboutW@16:
                    jmp [__imp__ShellAboutW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ShellAboutW@16:   dd unicows_initial_stub_ShellAboutW
_Unicows_ShellAboutW:      dd 0
namestring_ShellAboutW:    db 'ShellAboutW',0
