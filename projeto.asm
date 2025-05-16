;-----------------------------------------------------------
; Jogo da Memória 8051 (edSim51)
; Descrição: Setup inicial, controle de LEDs e delay.
;-----------------------------------------------------------
; --- Mapeamento de Hardware (8051) ---
      RS      equ     P1.3    ; Define o pino RS do LCD como P1.3
      EN      equ     P1.2    ; Define o pino EN do LCD como P1.2

    org 0000h
 	LJMP INICIO    ; Inicia a execução do programa em INICIO


    org 0030h
    SCORE equ 38H  ; Define o endereço 38H para armazenar o score

INICIO:
    MOV TMOD, #01h     ; Configura Timer 0 no modo 1 (16-bit)
    SETB TR0
    ; Define os valores ASCII para os dígitos da sequência
    ; 0 = 41h
    ; 1 = 4Bh
    ; 2 = 4Ah
    ; 3	= 49h
    ; 4 = 48h
    ; 5 = 47h
    ; 6	= 46h
    ; 7 = 45h
    ; 8 = 44h
    ; 9 = 43h

    ACALL GERA_ALEATORIO
 	MOV 31H, A     ; Primeiro dígito = 4
    ACALL GERA_ALEATORIO
    MOV 32H, A     ; Segundo dígito = 2
    ACALL GERA_ALEATORIO
    MOV 33H, A
    ACALL GERA_ALEATORIO
    MOV 34H, A
    ACALL GERA_ALEATORIO
    MOV 35H, A     ; Quinto dígito = 2
    ACALL GERA_ALEATORIO
    MOV 36H, A     ; Sexto dígito = 4
    ACALL GERA_ALEATORIO
    MOV 37H, A     ; Sétimo dígito = 3


 	MOV 20H, #'#' ; Define o caractere '#' para a tela do LCD
 	MOV 21H, #'0' ; Define o caractere '0' para a tela do LCD
 	MOV 22H, #'*' ; Define o caractere '' para a tela do LCD
	MOV 23H, #'9' ; Define o caractere '9' para a tela do LCD
 	MOV 24H, #'8' ; Define o caractere '8' para a tela do LCD
 	MOV 25H, #'7' ; Define o caractere '7' para a tela do LCD
 	MOV 26H, #'6' ; Define o caractere '6' para a tela do LCD
 	MOV 27H, #'5' ; Define o caractere '5' para a tela do LCD
	MOV 28H, #'4' ; Define o caractere '4' para a tela do LCD
	MOV 29H, #'3' ; Define o caractere '3' para a tela do LCD
	MOV 2AH, #'2' ; Define o caractere '2' para a tela do LCD
	MOV 2BH, #'1' ; Define o caractere '1' para a tela do LCD


 	MOV R5,#3 ; Define o número de tentativas de sequência como 3
	acall lcd_init; Inicializa o LCD
    MOV SCORE, #0 ; Inicializa o score com 0

MAIN:
	ACALL lcd_init
	MOV R1, #41H ; Define o endereço de memória para armazenar a sequência digitada
 	MOV R3, #7 ; Define o número de dígitos da sequência como 7

    MOV A, #00h
 	ACALL posicionaCursor ; Posiciona o cursor no início da tela
	MOV A, #'B'
 	ACALL sendCharacter ; Imprime o caractere 'B'
 	MOV A, #'E'
 	ACALL sendCharacter	; Imprime o caractere 'E'
 	MOV A, #'M'
 	ACALL sendCharacter ; Imprime o caractere 'M'
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #'V'
	ACALL sendCharacter ; Imprime o caractere 'V'
	MOV A, #'I'
	ACALL sendCharacter ; Imprime o caractere 'I'
	MOV A, #'N'
	ACALL sendCharacter ; Imprime o caractere 'N'
	MOV A, #'D'
	ACALL sendCharacter ; Imprime o caractere 'D'
	MOV A, #'O'
	ACALL sendCharacter ; Imprime o caractere 'O'
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #40H
	ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
 	MOV A, #'M'
 	ACALL sendCharacter ; Imprime o caractere 'M'
 	MOV A, #'E'
 	ACALL sendCharacter	; Imprime o caractere 'E'
	MOV A, #'M'
 	ACALL sendCharacter ; Imprime o caractere 'M'
	MOV A, #'O'
	ACALL sendCharacter ; Imprime o caractere 'O'
 	MOV A, #'R'
	ACALL sendCharacter		; Imprime o caractere 'R'
	MOV A, #'I'
 	ACALL sendCharacter	; Imprime o caractere 'I'
	MOV A, #'A'
	ACALL sendCharacter ; Imprime o caractere 'A'
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
    MOV A, #40H
	ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
 	MOV A, #'P'
 	ACALL sendCharacter ; Imprime o caractere 'P'
 	MOV A, #'R'
 	ACALL sendCharacter	; Imprime o caractere 'R'
	MOV A, #'E'
 	ACALL sendCharacter ; Imprime o caractere 'E'
	MOV A, #'S'
	ACALL sendCharacter ; Imprime o caractere 'S'
 	MOV A, #'S'
	ACALL sendCharacter		; Imprime o caractere 'S'
	MOV A, #'I'
 	ACALL sendCharacter	; Imprime o caractere 'I'
	MOV A, #'O'
	ACALL sendCharacter ; Imprime o caractere 'O'
 	MOV A, #'N'
 	ACALL sendCharacter	; Imprime o caractere 'N'
 	MOV A, #'E'
 	ACALL sendCharacter ; Imprime o caractere 'E'
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #'1'
	ACALL sendCharacter ; Imprime o caractere '1'
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
    ACALL leitura0
    ACALL MAIN



leitura0:
    INC R7
    ACALL GERA_ALEATORIO
 	MOV 31H, A
    ACALL GERA_ALEATORIO
    MOV 32H, A
    ACALL GERA_ALEATORIO
    MOV 33H, A
    ACALL GERA_ALEATORIO
    MOV 34H, A
    ACALL GERA_ALEATORIO
    MOV 35H, A
    ACALL GERA_ALEATORIO
    MOV 36H, A
    ACALL GERA_ALEATORIO
    MOV 37H, A
    MOV A,#0FFH
    ACALL leituraTeclado
    MOV A, R0
    CJNE A, #01H, NAO_ZERO_LEITURA0
    ACALL JOGO
NAO_ZERO_LEITURA0:
    LJMP leitura0

JOGO:
    SETB P0.0
    SETB P0.1
    SETB P0.2
    SETB P0.3
    CLR F0
    ; Imprime a mensagem "MEMORIZE A SEQUENCIA" na tela do LCD
	MOV A, #00h
 	ACALL posicionaCursor ; Posiciona o cursor no início da tela
	MOV A, #'M'
 	ACALL sendCharacter ; Imprime o caractere 'M'
 	MOV A, #'E'
 	ACALL sendCharacter	; Imprime o caractere 'E'
 	MOV A, #'M'
 	ACALL sendCharacter ; Imprime o caractere 'M'
 	MOV A, #'O'
 	ACALL sendCharacter ; Imprime o caractere 'O'
	MOV A, #'R'
	ACALL sendCharacter ; Imprime o caractere 'R'
	MOV A, #'I'
	ACALL sendCharacter ; Imprime o caractere 'I'
	MOV A, #'Z'
	ACALL sendCharacter ; Imprime o caractere 'Z'
	MOV A, #'E'
	ACALL sendCharacter ; Imprime o caractere 'E'
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #'A'
	ACALL sendCharacter ; Imprime o caractere 'A'
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #40H
	ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
 	MOV A, #'S'
 	ACALL sendCharacter ; Imprime o caractere 'S'
 	MOV A, #'E'
 	ACALL sendCharacter	; Imprime o caractere 'E'
	MOV A, #'Q'
 	ACALL sendCharacter ; Imprime o caractere 'Q'
	MOV A, #'U'
	ACALL sendCharacter ; Imprime o caractere 'U'
 	MOV A, #'E'
	ACALL sendCharacter		; Imprime o caractere 'E'
	MOV A, #'N'
 	ACALL sendCharacter	; Imprime o caractere 'N'
	MOV A, #'C'
	ACALL sendCharacter ; Imprime o caractere 'C'
 	MOV A, #'I'
 	ACALL sendCharacter	; Imprime o caractere 'I'
 	MOV A, #'A'
 	ACALL sendCharacter ; Imprime o caractere 'A'
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #00h
 	ACALL posicionaCursor ; Posiciona o cursor na terceira linha da tela
	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #40H
	ACALL posicionaCursor ; Posiciona o cursor na quarta linha da tela
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter		; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
 	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na quinta linha da tela
    MOV A, 31H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere '4'
    ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na sexta linha da tela
	MOV A, 32H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere '2'
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na sétima linha da tela
	MOV A, 33H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere '1'
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na oitava linha da tela
	MOV A, 34H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere '3'
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na nona linha da tela
	MOV A, 35H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere ' '
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na nona linha da tela
	MOV A, 36H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere ' '
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na nona linha da tela
	MOV A, 37H
	ADD A, #'0'
	ACALL sendCharacter	; Imprime o caractere ' '
	ACALL delay
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
	mov A, #07h
 	ACALL posicionaCursor ; Posiciona o cursor na nona linha da tela
	MOV A, #' '
	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
 	ACALL sendCharacter	; Imprime o caractere ' '
    MOV R6, #31H
    MOV A, #40H
    ACALL posicionaCursor   ; Posiciona na segunda linha
    MOV A, #' '
    ACALL sendCharacter
    MOV A, #' '
    ACALL sendCharacter
    MOV A, #' '
    ACALL sendCharacter
    MOV A, #' '
    ACALL sendCharacter
    MOV A, #' '            ; Converte posição para ASCII
    ACALL sendCharacter
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'V'
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'I'
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'D'
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'A'
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, R5
    ADD A , #'0'
   	ACALL sendCharacter ; Imprime o caractere ' '
    SJMP ROTINA

ERRO:
    MOV A, #00h
    ACALL posicionaCursor ; Posiciona o cursor no início da tela
    MOV A, #'E'
    ACALL sendCharacter ; Imprime o caractere 'S'
    MOV A, #'R'
    ACALL sendCharacter    ; Imprime o caractere 'E'
    MOV A, #'R'
    ACALL sendCharacter ; Imprime o caractere 'Q'
    MOV A, #'A'
    ACALL sendCharacter ; Imprime o caractere 'U'
    MOV A, #'D'
	ACALL sendCharacter        ; Imprime o caractere 'E'
   	MOV A, #'A'
    ACALL sendCharacter    ; Imprime o caractere 'N'
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere 'C'
   	MOV A, #' '
   	ACALL sendCharacter    ; Imprime o caractere 'I'
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere 'A'
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '

    INC R6
    INC R1                  ; Próxima posição de memória
    LJMP delay_tecla

ROTINA:
    MOV A, #40H
    ACALL posicionaCursor   ; Posiciona na segunda linha
    MOV A, #'D'
    ACALL sendCharacter
    MOV A, #'I'
    ACALL sendCharacter
    MOV A, #'G'
    ACALL sendCharacter
    MOV A, #' '
    ACALL sendCharacter
    MOV A, R3
    ADD A, #'0'             ; Converte posição para ASCII
    ACALL sendCharacter

    ACALL leituraTeclado ; Lê o valor do teclado
    JNB F0, ROTINA ; Agora convertemos R0 (valor numérico da tecla) para caractere ASCII
    MOV A, R0            ; Converte número para caractere ASCII ('0' = 30h)
    ACALL escreveLCD    ; Supondo que essa função imprime 1 caractere no LCD
    MOV A , #00h


    ; --- Armazena o valor da tecla na memória ---
    MOV A, R0               ; Recupera o valor original (0-15)
    MOV @R1, A              ; Armazena no endereço apontado por R1
    MOV B, R6
    MOV R0, B
    MOV B, @R0
    CJNE A, B, NOT_EQUAL  ; Salto para um rótulo próximo
    ; Se igual, continua
    SJMP CONTINUA
NOT_EQUAL:
    LJMP ERRO             ; Salto longo para o rótulo distante
CONTINUA:

    MOV A, #00h
    ACALL posicionaCursor ; Posiciona o cursor no início da tela
    MOV A, #'A'
    ACALL sendCharacter ; Imprime o caractere 'S'
    MOV A, #'C'
    ACALL sendCharacter    ; Imprime o caractere 'E'
    MOV A, #'E'
    ACALL sendCharacter ; Imprime o caractere 'Q'
    MOV A, #'R'
    ACALL sendCharacter ; Imprime o caractere 'U'
    MOV A, #'T'
	ACALL sendCharacter        ; Imprime o caractere 'E'
   	MOV A, #'O'
    ACALL sendCharacter    ; Imprime o caractere 'N'
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere 'C'
   	MOV A, #' '
   	ACALL sendCharacter    ; Imprime o caractere 'I'
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere 'A'
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '

    INC R6
    INC R1                  ; Próxima posição de memória
    INC SCORE ; Incrementa a variável de score
    INC 38
    ; --- Delay para visualização ---
delay_tecla:
    MOV R2, #5       ; Contador externo (ajuste o valor para mudar o tempo)
delay_loop:
    MOV R7, #255       ; Contador interno
    DJNZ R7, $         ; Decrementa R1 até zero (2 ciclos por iteração)
    DJNZ R2, delay_loop
    MOV R4, #7; Define o número de dígitos a serem comparados como 7
    CLR F0                  ; Reseta a flag de tecla pressionada
    DEC R3                  ; Decrement R3
    MOV A, R3               ; Check if R3 is zero
    CJNE A, #0, CONT_ROTINA ; If not zero, continue loop
    SJMP AFTER_ROTINA_LOOP  ; Exit loop if R3 is zero
CONT_ROTINA:
    LJMP ROTINA             ; Long jump back to ROTINA
AFTER_ROTINA_LOOP:         ; Repete para próxima tecla
    MOV R1, #41H; Define o endereço de memória para armazenar a sequência digitada
    MOV R0, #31H;  Define o endereço de memória para armazenar a sequência correta

COMPARACAO:
    MOV A, @R0 ; Move o valor do dígito da sequência correta para o registrador A
    MOV B, @R1 ; Move o valor do dígito da sequência digitada para o registrador B
    CJNE A,B , DIFERENTE ; Compara os valores em A e B. Se forem diferentes, pula para DIFERENTE
    INC R1 ; Incrementa o registrador R1 para apontar para o próximo dígito da sequência digitada
    INC R0; Incrementa o registrador R0 para apontar para o próximo dígito da sequência correta
    DJNZ R4, COMPARACAO ; Decrementa o contador de dígitos e repete a comparação se necessário
    SJMP CORRETO; Se a sequência estiver correta, pula para CORRETO


CORRETO:
    MOV P1, #0F0H ; Liga o LED verde
	MOV A, #00h
    ACALL posicionaCursor ; Posiciona o cursor no início da tela
    MOV A, #'S'
    ACALL sendCharacter ; Imprime o caractere 'S'
    MOV A, #'E'
	ACALL sendCharacter	; Imprime o caractere 'E'
	MOV A, #'Q'
    ACALL sendCharacter ; Imprime o caractere 'Q'
	MOV A, #'U'
	ACALL sendCharacter ; Imprime o caractere 'U'
    MOV A, #'E'
	ACALL sendCharacter ; Imprime o caractere 'E'
    MOV A, #'N'
    ACALL sendCharacter	; Imprime o caractere 'N'
    MOV A, #'C'
    ACALL sendCharacter ; Imprime o caractere 'C'
    MOV A, #'I'
    ACALL sendCharacter ; Imprime o caractere 'I'
	MOV A, #'A'
    ACALL sendCharacter ; Imprime o caractere 'A'
    MOV A, #' '
    ACALL sendCharacter	; Imprime o caractere ' '
    MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
	ACALL sendCharacter	; Imprime o caractere ' '
	MOV A, #' '
	MOV A, #40H
	ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
	MOV A, #'C'
	ACALL sendCharacter ; Imprime o caractere 'C'
	MOV A, #'O'
	ACALL sendCharacter ; Imprime o caractere 'O'
	MOV A, #'M'
	ACALL sendCharacter ; Imprime o caractere 'R'
	MOV A, #'P'
	ACALL sendCharacter ; Imprime o caractere 'R'
	MOV A, #'L'
	ACALL sendCharacter ; Imprime o caractere 'E'
	MOV A, #'E'
	ACALL sendCharacter ; Imprime o caractere 'T'
	MOV A, #'T'
	ACALL sendCharacter ; Imprime o caractere 'A'
	MOV A, #'A'
	ACALL sendCharacter ; Imprime o caractere ' '
	MOV A, #' '
	ACALL sendCharacter ; Imprime o caractere ' '
    ACALL exibeScore ; Exibe o score
	SJMP FIM ; Finaliza a execução do programa


    ; Caso a sequência estiver incorreta, executa esta função

DIFERENTE:
    MOV A, #00h
    ACALL posicionaCursor ; Posiciona o cursor no início da tela
    MOV A, #'S'
    ACALL sendCharacter ; Imprime o caractere 'S'
    MOV A, #'E'
    ACALL sendCharacter    ; Imprime o caractere 'E'
    MOV A, #'Q'
    ACALL sendCharacter ; Imprime o caractere 'Q'
    MOV A, #'U'
    ACALL sendCharacter ; Imprime o caractere 'U'
    MOV A, #'E'
	ACALL sendCharacter        ; Imprime o caractere 'E'
   	MOV A, #'N'
    ACALL sendCharacter    ; Imprime o caractere 'N'
	MOV A, #'C'
	ACALL sendCharacter ; Imprime o caractere 'C'
   	MOV A, #'I'
   	ACALL sendCharacter    ; Imprime o caractere 'I'
   	MOV A, #'A'
   	ACALL sendCharacter ; Imprime o caractere 'A'
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #40h
   	ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
   	MOV A, #'I'
   	ACALL sendCharacter ; Imprime o caractere 'I'
   	MOV A, #'N'
   	ACALL sendCharacter ; Imprime o caractere 'N'
   	MOV A, #'C'
   	ACALL sendCharacter ; Imprime o caractere 'C'
   	MOV A, #'O'
   	ACALL sendCharacter ; Imprime o caractere 'O'
   	MOV A, #'R'
   	ACALL sendCharacter ; Imprime o caractere 'R'
   	MOV A, #'R'
   	ACALL sendCharacter	; Imprime o caractere 'R'
   	MOV A, #'E'
   	ACALL sendCharacter ; Imprime o caractere 'E'
   	MOV A, #'T'
   	ACALL sendCharacter ; Imprime o caractere 'T'
   	MOV A, #'A'
   	ACALL sendCharacter ; Imprime o caractere 'A'
	DJNZ R5, RESET ; Decrementa o contador de tentativas e repete o processo se necessário
	SJMP FIM ; Finaliza a execução do programa


RESET:
    MOV 38H, #00h
	MOV R1, #41H ; Define o endereço de memória para armazenar a sequência digitada
	MOV R3, #7 ; Define o número de dígitos da sequência como 7
	LJMP JOGO ; Reinicia o processo de entrada da sequência

FIM:

    MOV A, #00h
    ACALL posicionaCursor ; Posiciona o cursor no início da tela
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'F'
    ACALL sendCharacter ; Imprime o caractere 'F'
    MOV A, #'I'
    ACALL sendCharacter ; Imprime o caractere 'I'
    MOV A, #'M'
    ACALL sendCharacter ; Imprime o caractere 'M'
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'D'
    ACALL sendCharacter ; Imprime o caractere 'D'
    MOV A, #'E'
    ACALL sendCharacter ; Imprime o caractere 'E'
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #'J'
    ACALL sendCharacter ; Imprime o caractere 'J'
    MOV A, #'O'
    ACALL sendCharacter ; Imprime o caractere 'O'
    MOV A, #'G'
    ACALL sendCharacter ; Imprime o caractere 'G'
    MOV A, #'O'
    ACALL sendCharacter ; Imprime o caractere 'O'
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #40H
    ACALL posicionaCursor ; Posiciona o cursor na segunda linha da tela
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
   	MOV A, #' '
   	ACALL sendCharacter ; Imprime o caractere ' '
    MOV A, #' '
    ACALL sendCharacter ; Imprime o caractere ' '
    ACALL exibeScore
	sjmp $ ; Finaliza a execução do programa

; --- Gerador de Números Aleatórios (1-9) ---
GERA_ALEATORIO:
    INC R7
    MOV A, TH0         ; Usa o Timer High (mais variável que TL0)
    ADD A, R7          ; Adiciona valor dinâmico de R7
    ADD A, 38H         ; Adiciona o valor do SCORE (endereço 38H)
    MOV B, #9          ; Divisor para faixa 1-9
    DIV AB             ; A/B: quociente em A, resto em B
    MOV A, B           ; Usa o resto da divisão (0-8)
    ADD A, #1          ; Ajusta para 1-9
    INC R7             ; Incrementa R7 para próxima aleatoriedade
    RET

leituraTeclado:
 	MOV R0, #01	; Inicializa o registrador R0 com 0
 	MOV P0, #0FFh	; Define todos os pinos de P0 como saídas
 	SETB P0.0; Desativa o pino P0.0
 	CLR P0.3
    CALL colScan	; Verifica se uma tecla foi pressionada nas colunas
 	JB F0, finish		; Se uma tecla foi pressionada, salta para finish

 	SETB P0.3		; Ativa o pino P0.0
 	CLR P0.2			; Desativa o pino P0.1
 	CALL colScan		; Verifica se uma tecla foi pressionada nas colunas
 	JB F0, finish		; Se uma tecla foi pressionada, salta para finish

	SETB P0.2			; Ativa o pino P0.1
 	CLR P0.1			; Desativa o pino P0.2
 	CALL colScan	; Verifica se uma tecla foi pressionada nas colunas
 	JB F0, finish	; Se uma tecla foi pressionada, salta para finish

 	SETB P0.1			; Ativa o pino P0.2
 	CLR P0.0			; Desativa o pino P0.3
 	CALL row0		; Verifica se uma tecla foi pressionada nas colunas
 	JB F0, finish		; Se uma tecla foi pressionada, salta para finish

finish:
 	RET ; Retorna da sub-rotina

colScan:
 	JNB P0.6, gotKey	; Se o pino P0.4 estiver baixo, salta para gotKey
 	INC R0				; Incrementa o registrador R0
 	JNB P0.5, gotKey	; Se o pino P0.5 estiver baixo, salta para gotKey
 	INC R0				; Incrementa o registrador R0
 	JNB P0.4, gotKey	; Se o pino P0.6 estiver baixo, salta para gotKey
 	INC R0				; Incrementa o registrador R0
 	RET				; Retorna da sub-rotina

gotKey:
    MOV A, R0
 	SETB F0				; Define a flag F0 como alta, indicando que uma tecla foi pressionada
 	RET				; Retorna da sub-rotina

zero:
    MOV A, #00H
    RET

sejaB:
    MOV A, #0BH
    RET

row0:
    JNB P0.6, gotKey ; if col2 is cleared - key found
    INC R0 ; otherwise move to next key
    JNB P0.5, zero ; if col1 is cleared - key found
    INC R0 ; otherwise move to next key
    JNB P0.4, sejaB ; if col0 is cleared - key found
    INC R0 ; otherwise move to next key


escreveLCD:
    MOV A, #0Ah
    ACALL posicionaCursor
    MOV A, R0
    ADD A, #'0'
    ACALL sendCharacter


lcd_init:

 	CLR RS		; Define o pino RS como baixo
 	CLR P1.7	; Define o pino P1.7 como baixo
 	CLR P1.6		; Define o pino P1.6 como baixo
	SETB P1.5		; Define o pino P1.5 como alto
	CLR P1.4	; Define o pino P1.4 como baixo

	SETB EN	; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo
 	CALL delay		; Espera um tempo

 	SETB EN		; Define o pino EN como alto
 	CLR EN	; Define o pino EN como baixo

 	SETB P1.7 ; Define o pino P1.7 como alto

 	SETB EN	; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo
 	CALL delay		; Espera um tempo

 	CLR P1.7		; Define o pino P1.7 como baixo
 	CLR P1.6		; Define o pino P1.6 como baixo
 	CLR P1.5		; Define o pino P1.5 como baixo
 	CLR P1.4		; Define o pino P1.4 como baixo

 	SETB EN	; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

 	SETB P1.6	; Define o pino P1.6 como alto
 	SETB P1.5	; Define o pino P1.5 como alto

 	SETB EN	; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

 	CALL delay	; Espera um tempo

 	CLR P1.7	; Define o pino P1.7 como baixo
 	CLR P1.6		; Define o pino P1.6 como baixo
 	CLR P1.5		; Define o pino P1.5 como baixo
 	CLR P1.4	; Define o pino P1.4 como baixo

 	SETB EN	; Define o pino EN como alto
	CLR EN	; Define o pino EN como baixo

	SETB P1.7	; Define o pino P1.7 como alto
	SETB P1.6		; Define o pino P1.6 como alto
	SETB P1.5		; Define o pino P1.5 como alto
	SETB P1.4		; Define o pino P1.4 como alto

	SETB EN		; Define o pino EN como alto
	CLR EN		; Define o pino EN como baixo

	CALL delay	; Espera um tempo
	RET ; Retorna da sub-rotina


exibeScore:
     MOV A, #40; Posiciona o cursor na segunda linha, um pouco antes do final

     ; Exibe o rótulo "SCORE:"
     MOV A, #'S'
     ACALL sendCharacter
     MOV A, #'C'
     ACALL sendCharacter
     MOV A, #'O'
     ACALL sendCharacter
     MOV A, #'R'
     ACALL sendCharacter
     MOV A, #'E'
     ACALL sendCharacter
     MOV A, #' ' ; Adiciona um espaço após o rótulo
     ACALL sendCharacter

     MOV A, SCORE ; Carrega o valor do score

     ADD A, #'0' ; Converte o dígito das dezenas para ASCII
     ACALL sendCharacter
     RET

sendCharacter:
 	SETB RS  	; Define o pino RS como alto
 	MOV C, ACC.7	; Move o bit 7 do acumulador para o registrador C
 	MOV P1.7, C		; Define o pino P1.7 de acordo com o valor de C
 	MOV C, ACC.6		; Move o bit 6 do acumulador para o registrador C
 	MOV P1.6, C			; Define o pino P1.6 de acordo com o valor de C
 	MOV C, ACC.5		; Move o bit 5 do acumulador para o registrador C
 	MOV P1.5, C			; Define o pino P1.5 de acordo com o valor de C
	MOV C, ACC.4	; Move o bit 4 do acumulador para o registrador C
 	MOV P1.4, C			; Define o pino P1.4 de acordo com o valor de C

 	SETB EN		; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

 	MOV C, ACC.3	; Move o bit 3 do acumulador para o registrador C
 	MOV P1.7, C		; Define o pino P1.7 de acordo com o valor de C
	MOV C, ACC.2	; Move o bit 2 do acumulador para o registrador C
	MOV P1.6, C		; Define o pino P1.6 de acordo com o valor de C
 	MOV C, ACC.1		; Move o bit 1 do acumulador para o registrador C
	MOV P1.5, C		; Define o pino P1.5 de acordo com o valor de C
 	MOV C, ACC.0		; Move o bit 0 do acumulador para o registrador C
 	MOV P1.4, C		; Define o pino P1.4 de acordo com o valor de C

	SETB EN		; Define o pino EN como alto
 	CLR EN			; Define o pino EN como baixo

 	CALL delay		; Espera um tempo
	CALL delay		; Espera um tempo
 	RET ; Retorna da sub-rotina

posicionaCursor:
 	CLR RS	; Define o pino RS como baixo
 	SETB P1.7		   ; Define o pino P1.7 como alto
 	MOV C, ACC.6		; Move o bit 6 do acumulador para o registrador C
 	MOV P1.6, C			; Define o pino P1.6 de acordo com o valor de C
	MOV C, ACC.5		; Move o bit 5 do acumulador para o registrador C
 	MOV P1.5, C			; Define o pino P1.5 de acordo com o valor de C
 	MOV C, ACC.4	; Move o bit 4 do acumulador para o registrador C
 	MOV P1.4, C		; Define o pino P1.4 de acordo com o valor de C

 	SETB EN			; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

	MOV C, ACC.3	; Move o bit 3 do acumulador para o registrador C
	MOV P1.7, C			; Define o pino P1.7 de acordo com o valor de C
 	MOV C, ACC.2		; Move o bit 2 do acumulador para o registrador C
	MOV P1.6, C ; Define o pino P1.6 de acordo com o valor de C
	MOV C, ACC.1		; Move o bit 1 do acumulador para o registrador C
	MOV P1.5, C			; Define o pino P1.5 de acordo com o valor de C
	MOV C, ACC.0	; Move o bit 0 do acumulador para o registrador C
	MOV P1.4, C			; Define o pino P1.4 de acordo com o valor de C

	SETB EN		; Define o pino EN como alto
	CLR EN			; Define o pino EN como baixo

	CALL delay			; Espera um tempo
 	CALL delay			; Espera um tempo
 	RET ; Retorna da sub-rotina

retornaCursor:
	CLR RS	; Define o pino RS como baixo
	CLR P1.7		; Define o pino P1.7 como baixo
	CLR P1.6	; Define o pino P1.6 como baixo
 	CLR P1.5		; Define o pino P1.5 como baixo
 	CLR P1.4		; Define o pino P1.4 como baixo

	SETB EN		; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

	CLR P1.7		; Define o pino P1.7 como baixo
 	CLR P1.6		; Define o pino P1.6 como baixo
 	SETB P1.5		; Define o pino P1.5 como alto
 	SETB P1.4		; Define o pino P1.4 como alto

 	SETB EN	; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

 	CALL delay		; Espera um tempo
 	RET ; Retorna da sub-rotina

clearDisplay:
 	CLR RS	; Define o pino RS como baixo
 	CLR P1.7		; Define o pino P1.7 como baixo
 	CLR P1.6		; Define o pino P1.6 como baixo
	CLR P1.5		; Define o pino P1.5 como baixo
	CLR P1.4		; Define o pino P1.4 como baixo

 	SETB EN		; Define o pino EN como alto
 	CLR EN		; Define o pino EN como baixo

 	CLR P1.7	; Define o pino P1.7 como baixo
 	CLR P1.6	; Define o pino P1.6 como baixo
	CLR P1.5		; Define o pino P1.5 como baixo
	SETB P1.4	; Define o pino P1.4 como alto

 	SETB EN	; Define o pino EN como alto
	CLR EN		; Define o pino EN como baixo

 	CALL delay		; Espera um tempo
 	RET ; Retorna da sub-rotina

delay:
 	MOV R7, #255 ; Define o valor inicial do registrador R7 como 15
 	DJNZ R7, $ ; Decrementa o registrador R7 e repete a instrução enquanto R7 for diferente de zero
 	RET ; Retorna da sub-rotina
