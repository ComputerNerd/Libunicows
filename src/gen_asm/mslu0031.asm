%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumFontFamiliesExW@20
                    global EnumFontFamiliesExW
                    global _EnumFontFamiliesExW@20
                    global _Unicows_EnumFontFamiliesExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumFontFamiliesExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumFontFamiliesExW@20     ; place to save the pointer
                    push dword [_Unicows_EnumFontFamiliesExW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumFontFamiliesExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumFontFamiliesExW:
_EnumFontFamiliesExW@20:
                    jmp [__imp__EnumFontFamiliesExW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumFontFamiliesExW@20:   dd unicows_initial_stub_EnumFontFamiliesExW
_Unicows_EnumFontFamiliesExW:      dd 0
namestring_EnumFontFamiliesExW:    db 'EnumFontFamiliesExW',0
