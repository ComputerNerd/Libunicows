%include "dll_names.inc"

                    global __imp__RegisterClipboardFormatW@4
                    global RegisterClipboardFormatW
                    global _RegisterClipboardFormatW@4
                    global _Unicows_RegisterClipboardFormatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegisterClipboardFormatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegisterClipboardFormatW@4     ; place to save the pointer
                    push dword [_Unicows_RegisterClipboardFormatW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_RegisterClipboardFormatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegisterClipboardFormatW:
_RegisterClipboardFormatW@4:
                    jmp [__imp__RegisterClipboardFormatW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegisterClipboardFormatW@4:   dd unicows_initial_stub_RegisterClipboardFormatW
_Unicows_RegisterClipboardFormatW:      dd 0
namestring_RegisterClipboardFormatW:    db 'RegisterClipboardFormatW',0
