%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RasCreatePhonebookEntryW@8
                    global RasCreatePhonebookEntryW
                    global _RasCreatePhonebookEntryW@8
                    global _Unicows_RasCreatePhonebookEntryW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RasCreatePhonebookEntryW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RasCreatePhonebookEntryW@8     ; place to save the pointer
                    push dword [_Unicows_RasCreatePhonebookEntryW]      ; default proc, if any
                    push dword RASAPI32                  ; dll id
                    push dword namestring_RasCreatePhonebookEntryW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RasCreatePhonebookEntryW:
_RasCreatePhonebookEntryW@8:
                    jmp [__imp__RasCreatePhonebookEntryW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RasCreatePhonebookEntryW@8:   dd unicows_initial_stub_RasCreatePhonebookEntryW
_Unicows_RasCreatePhonebookEntryW:      dd 0
namestring_RasCreatePhonebookEntryW:    db 'RasCreatePhonebookEntryW',0
