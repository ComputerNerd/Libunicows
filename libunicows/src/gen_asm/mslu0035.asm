%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ExtTextOutW@32
                    global ExtTextOutW
                    global _ExtTextOutW@32
                    global _Unicows_ExtTextOutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ExtTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtTextOutW@32     ; place to save the pointer
                    push dword [_Unicows_ExtTextOutW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_ExtTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ExtTextOutW:
_ExtTextOutW@32:
                    jmp [__imp__ExtTextOutW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ExtTextOutW@32:   dd unicows_initial_stub_ExtTextOutW
_Unicows_ExtTextOutW:      dd 0
namestring_ExtTextOutW:    db 'ExtTextOutW',0
