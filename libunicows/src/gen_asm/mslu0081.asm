%include "dll_names.inc"

                    global __imp__sndPlaySoundW@8
                    global sndPlaySoundW
                    global _sndPlaySoundW@8
                    global _Unicows_sndPlaySoundW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_sndPlaySoundW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__sndPlaySoundW@8     ; place to save the pointer
                    push dword [_Unicows_sndPlaySoundW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_sndPlaySoundW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

sndPlaySoundW:
_sndPlaySoundW@8:
                    jmp [__imp__sndPlaySoundW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__sndPlaySoundW@8:   dd unicows_initial_stub_sndPlaySoundW
_Unicows_sndPlaySoundW:      dd 0
namestring_sndPlaySoundW:    db 'sndPlaySoundW',0
