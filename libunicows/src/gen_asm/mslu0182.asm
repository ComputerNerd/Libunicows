%include "dll_names.inc"

                    global __imp__IsClipboardFormatAvailable@4
                    global IsClipboardFormatAvailable
                    global _IsClipboardFormatAvailable@4
                    global _Unicows_IsClipboardFormatAvailable
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_IsClipboardFormatAvailable:
                    ; Load the symbol...
                    pusha
                    push dword __imp__IsClipboardFormatAvailable@4     ; place to save the pointer
                    push dword [_Unicows_IsClipboardFormatAvailable]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_IsClipboardFormatAvailable      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

IsClipboardFormatAvailable:
_IsClipboardFormatAvailable@4:
                    jmp [__imp__IsClipboardFormatAvailable@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__IsClipboardFormatAvailable@4:   dd unicows_initial_stub_IsClipboardFormatAvailable
_Unicows_IsClipboardFormatAvailable:      dd 0
namestring_IsClipboardFormatAvailable:    db 'IsClipboardFormatAvailable',0
