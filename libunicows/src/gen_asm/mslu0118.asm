%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateAcceleratorTableW@8
                    global CreateAcceleratorTableW
                    global _CreateAcceleratorTableW@8
                    global _Unicows_CreateAcceleratorTableW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateAcceleratorTableW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateAcceleratorTableW@8     ; place to save the pointer
                    push dword [_Unicows_CreateAcceleratorTableW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_CreateAcceleratorTableW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateAcceleratorTableW:
_CreateAcceleratorTableW@8:
                    jmp [__imp__CreateAcceleratorTableW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateAcceleratorTableW@8:   dd unicows_initial_stub_CreateAcceleratorTableW
_Unicows_CreateAcceleratorTableW:      dd 0
namestring_CreateAcceleratorTableW:    db 'CreateAcceleratorTableW',0
