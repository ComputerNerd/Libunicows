%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetOutlineTextMetricsW@12
                    global GetOutlineTextMetricsW
                    global _GetOutlineTextMetricsW@12
                    global _Unicows_GetOutlineTextMetricsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetOutlineTextMetricsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOutlineTextMetricsW@12     ; place to save the pointer
                    push dword [_Unicows_GetOutlineTextMetricsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetOutlineTextMetricsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetOutlineTextMetricsW:
_GetOutlineTextMetricsW@12:
                    jmp [__imp__GetOutlineTextMetricsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetOutlineTextMetricsW@12:   dd unicows_initial_stub_GetOutlineTextMetricsW
_Unicows_GetOutlineTextMetricsW:      dd 0
namestring_GetOutlineTextMetricsW:    db 'GetOutlineTextMetricsW',0
