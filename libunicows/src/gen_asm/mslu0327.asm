%include "dll_names.inc"

                    global __imp__FormatMessageW@28
                    global FormatMessageW
                    global _FormatMessageW@28
                    global _Unicows_FormatMessageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FormatMessageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FormatMessageW@28     ; place to save the pointer
                    push dword [_Unicows_FormatMessageW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FormatMessageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FormatMessageW:
_FormatMessageW@28:
                    jmp [__imp__FormatMessageW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FormatMessageW@28:   dd unicows_initial_stub_FormatMessageW
_Unicows_FormatMessageW:      dd 0
namestring_FormatMessageW:    db 'FormatMessageW',0
