%include "dll_names.inc"

                    global __imp__EnumICMProfilesW@12
                    global EnumICMProfilesW
                    global _EnumICMProfilesW@12
                    global _Unicows_EnumICMProfilesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumICMProfilesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumICMProfilesW@12     ; place to save the pointer
                    push dword [_Unicows_EnumICMProfilesW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumICMProfilesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumICMProfilesW:
_EnumICMProfilesW@12:
                    jmp [__imp__EnumICMProfilesW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumICMProfilesW@12:   dd unicows_initial_stub_EnumICMProfilesW
_Unicows_EnumICMProfilesW:      dd 0
namestring_EnumICMProfilesW:    db 'EnumICMProfilesW',0
