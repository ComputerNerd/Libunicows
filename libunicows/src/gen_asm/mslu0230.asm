%include "dll_names.inc"

                    global __imp__TranslateAcceleratorW@12
                    global TranslateAcceleratorW
                    global _TranslateAcceleratorW@12
                    global _Unicows_TranslateAcceleratorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_TranslateAcceleratorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__TranslateAcceleratorW@12     ; place to save the pointer
                    push dword [_Unicows_TranslateAcceleratorW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_TranslateAcceleratorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

TranslateAcceleratorW:
_TranslateAcceleratorW@12:
                    jmp [__imp__TranslateAcceleratorW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__TranslateAcceleratorW@12:   dd unicows_initial_stub_TranslateAcceleratorW
_Unicows_TranslateAcceleratorW:      dd 0
namestring_TranslateAcceleratorW:    db 'TranslateAcceleratorW',0
