%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__EnumPrintProcessorDatatypesW@28
                    global EnumPrintProcessorDatatypesW
                    global _EnumPrintProcessorDatatypesW@28
                    global _Unicows_EnumPrintProcessorDatatypesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPrintProcessorDatatypesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPrintProcessorDatatypesW@28     ; place to save the pointer
                    push dword [_Unicows_EnumPrintProcessorDatatypesW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_EnumPrintProcessorDatatypesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPrintProcessorDatatypesW:
_EnumPrintProcessorDatatypesW@28:
                    jmp [__imp__EnumPrintProcessorDatatypesW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPrintProcessorDatatypesW@28:   dd unicows_initial_stub_EnumPrintProcessorDatatypesW
_Unicows_EnumPrintProcessorDatatypesW:      dd 0
namestring_EnumPrintProcessorDatatypesW:    db 'EnumPrintProcessorDatatypesW',0
