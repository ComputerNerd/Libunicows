%include "dll_names.inc"

                    global __imp__AddPrintProcessorW@16
                    global AddPrintProcessorW
                    global _AddPrintProcessorW@16
                    global _Unicows_AddPrintProcessorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_AddPrintProcessorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AddPrintProcessorW@16     ; place to save the pointer
                    push dword [_Unicows_AddPrintProcessorW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AddPrintProcessorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

AddPrintProcessorW:
_AddPrintProcessorW@16:
                    jmp [__imp__AddPrintProcessorW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__AddPrintProcessorW@16:   dd unicows_initial_stub_AddPrintProcessorW
_Unicows_AddPrintProcessorW:      dd 0
namestring_AddPrintProcessorW:    db 'AddPrintProcessorW',0
