%include "dll_names.inc"

                    global __imp__GetProfileSectionW@12
                    global GetProfileSectionW
                    global _GetProfileSectionW@12
                    global _Unicows_GetProfileSectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetProfileSectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetProfileSectionW@12     ; place to save the pointer
                    push dword [_Unicows_GetProfileSectionW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetProfileSectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetProfileSectionW:
_GetProfileSectionW@12:
                    jmp [__imp__GetProfileSectionW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetProfileSectionW@12:   dd unicows_initial_stub_GetProfileSectionW
_Unicows_GetProfileSectionW:      dd 0
namestring_GetProfileSectionW:    db 'GetProfileSectionW',0
