%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetOpenFileNamePreviewW@4
                    global GetOpenFileNamePreviewW
                    global _GetOpenFileNamePreviewW@4
                    global _Unicows_GetOpenFileNamePreviewW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetOpenFileNamePreviewW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetOpenFileNamePreviewW@4     ; place to save the pointer
                    push dword [_Unicows_GetOpenFileNamePreviewW]      ; default proc, if any
                    push dword MSVFW32                  ; dll id
                    push dword namestring_GetOpenFileNamePreviewW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetOpenFileNamePreviewW:
_GetOpenFileNamePreviewW@4:
                    jmp [__imp__GetOpenFileNamePreviewW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetOpenFileNamePreviewW@4:   dd unicows_initial_stub_GetOpenFileNamePreviewW
_Unicows_GetOpenFileNamePreviewW:      dd 0
namestring_GetOpenFileNamePreviewW:    db 'GetOpenFileNamePreviewW',0
