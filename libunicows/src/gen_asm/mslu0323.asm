%include "dll_names.inc"

                    global __imp__FindFirstFileW@8
                    global FindFirstFileW
                    global _FindFirstFileW@8
                    global _Unicows_FindFirstFileW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindFirstFileW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindFirstFileW@8     ; place to save the pointer
                    push dword [_Unicows_FindFirstFileW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindFirstFileW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindFirstFileW:
_FindFirstFileW@8:
                    jmp [__imp__FindFirstFileW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindFirstFileW@8:   dd unicows_initial_stub_FindFirstFileW
_Unicows_FindFirstFileW:      dd 0
namestring_FindFirstFileW:    db 'FindFirstFileW',0
