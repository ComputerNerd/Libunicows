%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasEditPhonebookEntryW@12
                    global RasEditPhonebookEntryW
                    global _RasEditPhonebookEntryW@12
                    global _Unicows_RasEditPhonebookEntryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasEditPhonebookEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasEditPhonebookEntryW@12     ; place to save the pointer
                    push dword [_Unicows_RasEditPhonebookEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasEditPhonebookEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasEditPhonebookEntryW:
_RasEditPhonebookEntryW@12:
                    jmp [__imp__RasEditPhonebookEntryW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasEditPhonebookEntryW@12:   dd unicows_initial_stub_RasEditPhonebookEntryW
_Unicows_RasEditPhonebookEntryW:      dd 0
namestring_RasEditPhonebookEntryW:    db 'RasEditPhonebookEntryW',0
