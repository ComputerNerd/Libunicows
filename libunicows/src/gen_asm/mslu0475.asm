%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumPortsW@24
                    global EnumPortsW
                    global _EnumPortsW@24
                    global _Unicows_EnumPortsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPortsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPortsW@24     ; place to save the pointer
                    push dword [_Unicows_EnumPortsW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPortsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPortsW:
_EnumPortsW@24:
                    jmp [__imp__EnumPortsW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPortsW@24:   dd unicows_initial_stub_EnumPortsW
_Unicows_EnumPortsW:      dd 0
namestring_EnumPortsW:    db 'EnumPortsW',0
