%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__GetGlyphOutlineW@28
                    global GetGlyphOutlineW
                    global _GetGlyphOutlineW@28
                    global _Unicows_GetGlyphOutlineW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetGlyphOutlineW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetGlyphOutlineW@28     ; place to save the pointer
                    push dword [_Unicows_GetGlyphOutlineW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetGlyphOutlineW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetGlyphOutlineW:
_GetGlyphOutlineW@28:
                    jmp [__imp__GetGlyphOutlineW@28]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetGlyphOutlineW@28:   dd unicows_initial_stub_GetGlyphOutlineW
_Unicows_GetGlyphOutlineW:      dd 0
namestring_GetGlyphOutlineW:    db 'GetGlyphOutlineW',0
