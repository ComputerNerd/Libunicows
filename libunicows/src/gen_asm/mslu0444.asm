%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasValidateEntryNameW@8
                    global RasValidateEntryNameW
                    global _RasValidateEntryNameW@8
                    global _Unicows_RasValidateEntryNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasValidateEntryNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasValidateEntryNameW@8     ; place to save the pointer
                    push dword [_Unicows_RasValidateEntryNameW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasValidateEntryNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasValidateEntryNameW:
_RasValidateEntryNameW@8:
                    jmp [__imp__RasValidateEntryNameW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasValidateEntryNameW@8:   dd unicows_initial_stub_RasValidateEntryNameW
_Unicows_RasValidateEntryNameW:      dd 0
namestring_RasValidateEntryNameW:    db 'RasValidateEntryNameW',0
