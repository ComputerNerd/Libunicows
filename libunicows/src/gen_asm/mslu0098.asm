%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIPromptUserW
                    global OleUIPromptUserW
                    global _OleUIPromptUserW
                    global _Unicows_OleUIPromptUserW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIPromptUserW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIPromptUserW     ; place to save the pointer
                    push dword [_Unicows_OleUIPromptUserW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIPromptUserW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIPromptUserW:
_OleUIPromptUserW:
                    jmp [__imp__OleUIPromptUserW]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIPromptUserW:   dd unicows_initial_stub_OleUIPromptUserW
_Unicows_OleUIPromptUserW:      dd 0
namestring_OleUIPromptUserW:    db 'OleUIPromptUserW',0
