%include "dll_names.inc"

                    global __imp__GetPrintProcessorDirectoryW@24
                    global GetPrintProcessorDirectoryW
                    global _GetPrintProcessorDirectoryW@24
                    global _Unicows_GetPrintProcessorDirectoryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrintProcessorDirectoryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrintProcessorDirectoryW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrintProcessorDirectoryW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_GetPrintProcessorDirectoryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrintProcessorDirectoryW:
_GetPrintProcessorDirectoryW@24:
                    jmp [__imp__GetPrintProcessorDirectoryW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrintProcessorDirectoryW@24:   dd unicows_initial_stub_GetPrintProcessorDirectoryW
_Unicows_GetPrintProcessorDirectoryW:      dd 0
namestring_GetPrintProcessorDirectoryW:    db 'GetPrintProcessorDirectoryW',0
