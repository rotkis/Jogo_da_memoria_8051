;-----------------------------------------------------------
; Jogo da Memória 8051 (edSim51) - Parte 1
; Descrição: Setup inicial, controle de LEDs e delay.
;-----------------------------------------------------------
; --- Mapeamento de Hardware (8051) ---
     RS      equ     P1.3    ; Define o pino RS do LCD como P1.3
     EN      equ     P1.2    ; Define o pino EN do LCD como P1.2

     org 0000h
     LJMP INICIO     ; Inicia a execução do programa em INICIO

     org 0030h
     INICIO:
     ; Código principal começará aqui
     SJMP $ ; Loop infinito temporário
     END

