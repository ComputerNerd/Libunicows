%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__SetWindowsHookExW@16
                    global SetWindowsHookExW
                    global _SetWindowsHookExW@16
                    global _Unicows_SetWindowsHookExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetWindowsHookExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetWindowsHookExW@16     ; place to save the pointer
                    push dword [_Unicows_SetWindowsHookExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_SetWindowsHookExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetWindowsHookExW:
_SetWindowsHookExW@16:
                    jmp [__imp__SetWindowsHookExW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetWindowsHookExW@16:   dd unicows_initial_stub_SetWindowsHookExW
_Unicows_SetWindowsHookExW:      dd 0
namestring_SetWindowsHookExW:    db 'SetWindowsHookExW',0
