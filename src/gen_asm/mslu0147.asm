%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumDisplaySettingsW@12
                    global EnumDisplaySettingsW
                    global _EnumDisplaySettingsW@12
                    global _Unicows_EnumDisplaySettingsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumDisplaySettingsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumDisplaySettingsW@12     ; place to save the pointer
                    push dword [_Unicows_EnumDisplaySettingsW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumDisplaySettingsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumDisplaySettingsW:
_EnumDisplaySettingsW@12:
                    jmp [__imp__EnumDisplaySettingsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumDisplaySettingsW@12:   dd unicows_initial_stub_EnumDisplaySettingsW
_Unicows_EnumDisplaySettingsW:      dd 0
namestring_EnumDisplaySettingsW:    db 'EnumDisplaySettingsW',0
