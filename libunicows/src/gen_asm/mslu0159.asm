%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetClipboardData@4
                    global GetClipboardData
                    global _GetClipboardData@4
                    global _Unicows_GetClipboardData
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetClipboardData:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClipboardData@4     ; place to save the pointer
                    push dword [_Unicows_GetClipboardData]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClipboardData      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetClipboardData:
_GetClipboardData@4:
                    jmp [__imp__GetClipboardData@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetClipboardData@4:   dd unicows_initial_stub_GetClipboardData
_Unicows_GetClipboardData:      dd 0
namestring_GetClipboardData:    db 'GetClipboardData',0
