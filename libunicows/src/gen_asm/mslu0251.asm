%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__Shell_NotifyIconW@8
                    global Shell_NotifyIconW
                    global _Shell_NotifyIconW@8
                    global _Unicows_Shell_NotifyIconW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_Shell_NotifyIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__Shell_NotifyIconW@8     ; place to save the pointer
                    push dword [_Unicows_Shell_NotifyIconW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_Shell_NotifyIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

Shell_NotifyIconW:
_Shell_NotifyIconW@8:
                    jmp [__imp__Shell_NotifyIconW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__Shell_NotifyIconW@8:   dd unicows_initial_stub_Shell_NotifyIconW
_Unicows_Shell_NotifyIconW:      dd 0
namestring_Shell_NotifyIconW:    db 'Shell_NotifyIconW',0
