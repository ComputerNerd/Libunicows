%include "dll_names.inc"

                    global __imp__BuildCommDCBAndTimeoutsW@12
                    global BuildCommDCBAndTimeoutsW
                    global _BuildCommDCBAndTimeoutsW@12
                    global _Unicows_BuildCommDCBAndTimeoutsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_BuildCommDCBAndTimeoutsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__BuildCommDCBAndTimeoutsW@12     ; place to save the pointer
                    push dword [_Unicows_BuildCommDCBAndTimeoutsW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_BuildCommDCBAndTimeoutsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

BuildCommDCBAndTimeoutsW:
_BuildCommDCBAndTimeoutsW@12:
                    jmp [__imp__BuildCommDCBAndTimeoutsW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__BuildCommDCBAndTimeoutsW@12:   dd unicows_initial_stub_BuildCommDCBAndTimeoutsW
_Unicows_BuildCommDCBAndTimeoutsW:      dd 0
namestring_BuildCommDCBAndTimeoutsW:    db 'BuildCommDCBAndTimeoutsW',0
