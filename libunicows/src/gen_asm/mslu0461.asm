%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumMonitorsW@24
                    global EnumMonitorsW
                    global _EnumMonitorsW@24
                    global _Unicows_EnumMonitorsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumMonitorsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumMonitorsW@24     ; place to save the pointer
                    push dword [_Unicows_EnumMonitorsW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumMonitorsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumMonitorsW:
_EnumMonitorsW@24:
                    jmp [__imp__EnumMonitorsW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumMonitorsW@24:   dd unicows_initial_stub_EnumMonitorsW
_Unicows_EnumMonitorsW:      dd 0
namestring_EnumMonitorsW:    db 'EnumMonitorsW',0
