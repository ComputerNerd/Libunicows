%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetTextMetricsW@8
                    global GetTextMetricsW
                    global _GetTextMetricsW@8
                    global _Unicows_GetTextMetricsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetTextMetricsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetTextMetricsW@8     ; place to save the pointer
                    push dword [_Unicows_GetTextMetricsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetTextMetricsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetTextMetricsW:
_GetTextMetricsW@8:
                    jmp [__imp__GetTextMetricsW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetTextMetricsW@8:   dd unicows_initial_stub_GetTextMetricsW
_Unicows_GetTextMetricsW:      dd 0
namestring_GetTextMetricsW:    db 'GetTextMetricsW',0
