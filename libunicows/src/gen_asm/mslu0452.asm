%include "dll_names.inc"

                    global __imp__AdvancedDocumentPropertiesW@20
                    global _AdvancedDocumentPropertiesW@20
                    global _Unicows_AdvancedDocumentPropertiesW
                  
                    extern _LoadUnicowsSymbol

                    section .text

unicows_initial_stub_AdvancedDocumentPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__AdvancedDocumentPropertiesW@20     ; place to save the pointer
                    push dword [_Unicows_AdvancedDocumentPropertiesW]      ; default proc, if any
                    push dword WINSPOOL                  ; dll id
                    push dword namestring_AdvancedDocumentPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it
                    jmp [__imp__AdvancedDocumentPropertiesW@20]

_AdvancedDocumentPropertiesW@20:
                    jmp [__imp__AdvancedDocumentPropertiesW@20]


                    section .data

__imp__AdvancedDocumentPropertiesW@20:   dd unicows_initial_stub_AdvancedDocumentPropertiesW
_Unicows_AdvancedDocumentPropertiesW:      dd 0
namestring_AdvancedDocumentPropertiesW:    db 'AdvancedDocumentPropertiesW',0
