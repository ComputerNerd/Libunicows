%include "dll_names.inc"

                    global __imp__OleUIPasteSpecialW@4
                    global OleUIPasteSpecialW
                    global _OleUIPasteSpecialW@4
                    global _Unicows_OleUIPasteSpecialW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIPasteSpecialW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIPasteSpecialW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIPasteSpecialW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIPasteSpecialW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIPasteSpecialW:
_OleUIPasteSpecialW@4:
                    jmp [__imp__OleUIPasteSpecialW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIPasteSpecialW@4:   dd unicows_initial_stub_OleUIPasteSpecialW
_Unicows_OleUIPasteSpecialW:      dd 0
namestring_OleUIPasteSpecialW:    db 'OleUIPasteSpecialW',0
