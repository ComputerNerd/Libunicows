%include "dll_names.inc"

                    global __imp__MultinetGetConnectionPerformanceW@8
                    global MultinetGetConnectionPerformanceW
                    global _MultinetGetConnectionPerformanceW@8
                    global _Unicows_MultinetGetConnectionPerformanceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MultinetGetConnectionPerformanceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MultinetGetConnectionPerformanceW@8     ; place to save the pointer
                    push dword [_Unicows_MultinetGetConnectionPerformanceW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_MultinetGetConnectionPerformanceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MultinetGetConnectionPerformanceW:
_MultinetGetConnectionPerformanceW@8:
                    jmp [__imp__MultinetGetConnectionPerformanceW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MultinetGetConnectionPerformanceW@8:   dd unicows_initial_stub_MultinetGetConnectionPerformanceW
_Unicows_MultinetGetConnectionPerformanceW:      dd 0
namestring_MultinetGetConnectionPerformanceW:    db 'MultinetGetConnectionPerformanceW',0
