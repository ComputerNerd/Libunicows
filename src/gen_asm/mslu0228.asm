%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetWindowsHookW@8
                    global SetWindowsHookW
                    global _SetWindowsHookW@8
                    global _Unicows_SetWindowsHookW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetWindowsHookW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowsHookW@8     ; place to save the pointer
                    push dword [_Unicows_SetWindowsHookW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowsHookW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetWindowsHookW:
_SetWindowsHookW@8:
                    jmp [__imp__SetWindowsHookW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetWindowsHookW@8:   dd unicows_initial_stub_SetWindowsHookW
_Unicows_SetWindowsHookW:      dd 0
namestring_SetWindowsHookW:    db 'SetWindowsHookW',0
