%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__CreateFontW@56
                    global CreateFontW
                    global _CreateFontW@56
                    global _Unicows_CreateFontW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_CreateFontW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__CreateFontW@56     ; place to save the pointer
                    push dword [_Unicows_CreateFontW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_CreateFontW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

CreateFontW:
_CreateFontW@56:
                    jmp [__imp__CreateFontW@56]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__CreateFontW@56:   dd unicows_initial_stub_CreateFontW
_Unicows_CreateFontW:      dd 0
namestring_CreateFontW:    db 'CreateFontW',0