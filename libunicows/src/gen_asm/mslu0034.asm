%include "dll_names.inc"

                    global __imp__EnumICMProfilesW@12
                    global _EnumICMProfilesW@12
                    global _Unicows_EnumICMProfilesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_EnumICMProfilesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumICMProfilesW@12     ; place to save the pointer
                    push dword [_Unicows_EnumICMProfilesW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_EnumICMProfilesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__EnumICMProfilesW@12]

_EnumICMProfilesW@12:
                    jmp [__imp__EnumICMProfilesW@12]


                    section .data

__imp__EnumICMProfilesW@12:   dd unicows_initial_stub_EnumICMProfilesW
_Unicows_EnumICMProfilesW:      dd 0
namestring_EnumICMProfilesW:    db 'EnumICMProfilesW',0
