%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__lstrcmpiW@8
                    global lstrcmpiW
                    global _lstrcmpiW@8
                    global _Unicows_lstrcmpiW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_lstrcmpiW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__lstrcmpiW@8     ; place to save the pointer
                    push dword [_Unicows_lstrcmpiW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_lstrcmpiW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

lstrcmpiW:
_lstrcmpiW@8:
                    jmp [__imp__lstrcmpiW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__lstrcmpiW@8:   dd unicows_initial_stub_lstrcmpiW
_Unicows_lstrcmpiW:      dd 0
namestring_lstrcmpiW:    db 'lstrcmpiW',0
