%include "dll_names.inc"

                    global __imp__GetGlyphOutlineW@28
                    global _GetGlyphOutlineW@28
                    global _Unicows_GetGlyphOutlineW
                  
                    extern _LoadUnicowsSymbol

                    section .text

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

                    ; ...and skip to it
                    jmp [__imp__GetGlyphOutlineW@28]

_GetGlyphOutlineW@28:
                    jmp [__imp__GetGlyphOutlineW@28]


                    section .data

__imp__GetGlyphOutlineW@28:   dd unicows_initial_stub_GetGlyphOutlineW
_Unicows_GetGlyphOutlineW:      dd 0
namestring_GetGlyphOutlineW:    db 'GetGlyphOutlineW',0
