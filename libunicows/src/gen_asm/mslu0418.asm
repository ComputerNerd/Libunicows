%include "dll_names.inc"

                    global __imp__WriteProfileSectionW@8
                    global WriteProfileSectionW
                    global _WriteProfileSectionW@8
                    global _Unicows_WriteProfileSectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WriteProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteProfileSectionW@8     ; place to save the pointer
                    push dword [_Unicows_WriteProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WriteProfileSectionW:
_WriteProfileSectionW@8:
                    jmp [__imp__WriteProfileSectionW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WriteProfileSectionW@8:   dd unicows_initial_stub_WriteProfileSectionW
_Unicows_WriteProfileSectionW:      dd 0
namestring_WriteProfileSectionW:    db 'WriteProfileSectionW',0
