%include "dll_names.inc"

                    global __imp__GetCharacterPlacementW@24
                    global _GetCharacterPlacementW@24
                    global _Unicows_GetCharacterPlacementW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_GetCharacterPlacementW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharacterPlacementW@24     ; place to save the pointer
                    push dword [_Unicows_GetCharacterPlacementW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharacterPlacementW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__GetCharacterPlacementW@24]

_GetCharacterPlacementW@24:
                    jmp [__imp__GetCharacterPlacementW@24]


                    section .data

__imp__GetCharacterPlacementW@24:   dd unicows_initial_stub_GetCharacterPlacementW
_Unicows_GetCharacterPlacementW:      dd 0
namestring_GetCharacterPlacementW:    db 'GetCharacterPlacementW',0
