%include "dll_names.inc"

                    global __imp__EnumFontsW@16
                    global EnumFontsW
                    global _EnumFontsW@16
                    global _Unicows_EnumFontsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumFontsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumFontsW@16     ; place to save the pointer
                    push dword [_Unicows_EnumFontsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumFontsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumFontsW:
_EnumFontsW@16:
                    jmp [__imp__EnumFontsW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumFontsW@16:   dd unicows_initial_stub_EnumFontsW
_Unicows_EnumFontsW:      dd 0
namestring_EnumFontsW:    db 'EnumFontsW',0
