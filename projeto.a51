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
     ; Define os valores ASCII para os dígitos da sequência (Exemplo: '4' = 34h em ASCII, mas o código usa outros valores?)
     ; Nota: Os comentários ASCII no código original parecem incorretos/diferentes do padrão.
     ; Usando os valores do código:
     ; '4' -> 48h
     ; '2' -> 4Ah
     ; '1' -> 4Bh
     ; '3' -> 49h

     MOV 31H, #48h ; Define o primeiro dígito da sequência como '4' (usando valor 48h)
     MOV 32H, #4Ah ; Define o segundo dígito da sequência como '2' (usando valor 4Ah)
     MOV 33H, #4Bh ; Define o terceiro dígito da sequência como '1' (usando valor 4Bh)
     MOV 34H, #49h ; Define o quarto dígito da sequência como '3' (usando valor 49h)
     MOV 35H, #4Ah ; Define o quinto dígito da sequência como '2' (usando valor 4Ah)
     MOV 36H, #48h ; Define o sexto dígito da sequência como '4' (usando valor 48h)
     MOV 37H, #49h ; Define o sétimo dígito da sequência como '3' (usando valor 49h)

     ; Mapeamento de caracteres para display (indexados por R0 na leitura do teclado)
     MOV 20H, #'#' ; '#' (índice 0)
     MOV 21H, #'0' ; '0' (índice 1)
     MOV 22H, #'*' ; '*' (índice 2)
     MOV 23H, #'9' ; '9' (índice 3)
     MOV 24H, #'8' ; '8' (índice 4)
     MOV 25H, #'7' ; '7' (índice 5)
     MOV 26H, #'6' ; '6' (índice 6)
     MOV 27H, #'5' ; '5' (índice 7)
     MOV 28H, #'4' ; '4' (índice 8)
     MOV 29H, #'3' ; '3' (índice 9)
     MOV 2AH, #'2' ; '2' (índice 10)
     MOV 2BH, #'1' ; '1' (índice 11)

     SJMP $ ; Loop infinito temporário
     
     delay:
         MOV R7, #15 ; Define o valor inicial do registrador R7 como 15 (ajustar para delay desejado)
     delay_loop:
         DJNZ R7, delay_loop ; Decrementa R7 e repete até R7 ser zero
         RET ; Retorna da sub-rotina

     END
