%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__TabbedTextOutW@32
                    global TabbedTextOutW
                    global _TabbedTextOutW@32
                    global _Unicows_TabbedTextOutW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_TabbedTextOutW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TabbedTextOutW@32     ; place to save the pointer
                    push dword [_Unicows_TabbedTextOutW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_TabbedTextOutW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

TabbedTextOutW:
_TabbedTextOutW@32:
                    jmp [__imp__TabbedTextOutW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__TabbedTextOutW@32:   dd unicows_initial_stub_TabbedTextOutW
_Unicows_TabbedTextOutW:      dd 0
namestring_TabbedTextOutW:    db 'TabbedTextOutW',0
