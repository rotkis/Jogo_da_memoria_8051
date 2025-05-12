## Descrição

O jogo da memória desenvolvido em linguagem Assembly consiste em uma versão simplificada do clássico jogo da memoria. A aplicação foi projetada para funcionar em ambiente de terminal e foi implementada com base nos princípios da programação de baixo nível, manipulando diretamente registradores, instruções aritméticas e controle de fluxo.

## Objetivo do Projeto

Este projeto tem como objetivo explorar a lógica de controle de fluxo, manipulação de dados em memória e interações básicas de entrada e saída utilizando linguagem de montagem. A implementação do jogo da memória serve como exercício prático para consolidar conhecimentos sobre o funcionamento interno do processador e como operações de alto nível são traduzidas para baixo nível.

## Mapeamento de Hardware

As seguintes definições de pinos são utilizadas para interagir com o hardware externo:

* **RS (P1.3):** Pino de seleção de registrador do LCD.
* **EN (P1.2):** Pino de habilitação (Enable) do LCD.
* **Teclado Matricial (P0):** Conectado a um teclado matricial para entrada do jogador. A configuração específica do teclado (linhas e colunas) é assumida na rotina `leituraTeclado`.
* **LED Verde (P1.?)**: Um LED verde é aceso para indicar uma sequência correta (o pino exato depende da configuração em `CORRETO`).

## Organização do Código

O código está estruturado da seguinte forma:

1.  **Definições de Hardware:** Mapeamento dos pinos do microcontrolador para os componentes externos.
2.  **Vetor de Reset:** Define o ponto de entrada do programa para a rotina `INICIO`.
3.  **Definição de Variáveis:** Define os endereços de memória para variáveis importantes:
    * `SCORE (38H)`: Armazena a pontuação do jogador.
    * `SEQUENCIA_CORRETA (31H - 37H)`: Armazena a sequência de 7 dígitos a ser memorizada.
    * `SEQUENCIA_DIGITADA (41H - 47H)`: Armazena a sequência de 7 dígitos digitada pelo jogador.
    * `CARACTERES_LCD (20H - 2BH)`: Armazena caracteres ASCII frequentemente usados para o display LCD.
4.  **Rotina INICIO:**
    * Inicializa a sequência de 7 dígitos na memória (`SEQUENCIA_CORRETA`).
    * Define caracteres ASCII para serem usados no display LCD (`CARACTERES_LCD`).
    * Define o número inicial de tentativas para o jogador (`R5 = 3`).
    * Inicializa o display LCD chamando a sub-rotina `lcd_init`.
    * Inicializa a pontuação do jogador (`SCORE = 0`).
    * Chama a rotina `MAIN` para iniciar o jogo.
5.  **Rotina MAIN:**
    * Exibe a tela de boas-vindas ("BEM VINDO" e "MEMORIA").
    * Exibe a instrução inicial ("PRESSIONE 1").
    * Aguarda o jogador pressionar a tecla '1' para iniciar o jogo através da rotina `leitura0`.
6.  **Rotina leitura0:**
    * Aguarda a leitura de uma tecla através da sub-rotina `leituraTeclado`.
    * Se a tecla lida for `01H` (correspondente à tecla '1' no teclado assumido), inicia a rotina do jogo (`JOGO`).
    * Caso contrário, permanece em `MAIN`.
7.  **Rotina JOGO:**
    * Exibe a mensagem "MEMORIZE A SEQUENCIA" no LCD.
    * Exibe a sequência de 7 dígitos armazenada em `SEQUENCIA_CORRETA` no LCD, um dígito por linha.
    * Chama a rotina `ROTINA` para iniciar a leitura da sequência digitada pelo jogador.
8.  **Rotina ROTINA:**
    * Lê 7 teclas pressionadas pelo jogador usando `leituraTeclado`.
    * Para cada tecla:
        * Converte o valor numérico da tecla para seu caractere ASCII correspondente (adicionando `'0'`).
        * Chama `escreveLCD` para exibir o caractere digitado no LCD.
        * Armazena o valor numérico da tecla (0-9) na memória em `SEQUENCIA_DIGITADA`.
        * Implementa um pequeno delay para visualização da tecla.
    * Após a leitura de 7 dígitos, chama a rotina `COMPARACAO`.
9.  **Rotina COMPARACAO:**
    * Compara cada dígito da sequência digitada (`SEQUENCIA_DIGITADA`) com a sequência correta (`SEQUENCIA_CORRETA`).
    * Se um dígito for diferente, pula para a rotina `DIFERENTE`.
    * Se todos os dígitos forem iguais, incrementa o `SCORE` e pula para a rotina `CORRETO`.
10. **Rotina CORRETO:**
    * Acende o LED verde (conectado a `P1` com valor `0F0H`).
    * Exibe a mensagem "SEQUENCIA CORRETA" no LCD.
    * Chama a rotina `exibeScore` para mostrar a pontuação atual.
    * Pula para a rotina `FIM` (nesta versão, o jogo termina após uma sequência correta; uma versão mais completa poderia ter mais rodadas).
11. **Rotina DIFERENTE:**
    * Exibe a mensagem "SEQUENCIA INCORRETA" no LCD.
    * Decrementa o número de tentativas restantes (`R5`).
    * Se ainda houver tentativas (`R5 != 0`), pula para a rotina `RESET` para permitir que o jogador tente novamente a mesma sequência.
    * Se não houver mais tentativas (`R5 == 0`), pula para a rotina `FIM`.
12. **Rotina RESET:**
    * Reinicializa o ponteiro de memória para a sequência digitada (`R1`).
    * Reinicializa o contador de dígitos (`R3`).
    * Pula de volta para a rotina `JOGO` para apresentar a mesma sequência novamente.
13. **Rotina FIM:**
    * Exibe a mensagem "FIM DE JOGO" no LCD.
    * Chama `exibeScore` para mostrar a pontuação final.
    * Entra em um loop infinito (`sjmp $`).
14. **Rotina leituraTeclado:**
    * Implementa a lógica para ler a entrada de um teclado matricial conectado à porta `P0`.
    * Utiliza uma técnica de escaneamento de colunas para detectar qual tecla (0-9, *, #) foi pressionada.
    * Define a flag `F0` quando uma tecla é pressionada e armazena o valor numérico da tecla (0-15) em `R0`. O mapeamento específico das teclas para os valores em `R0` depende da fiação do teclado.
15. **Sub-rotinas Auxiliares:**
    * `colScan`: Sub-rotina chamada por `leituraTeclado` para escanear as colunas do teclado.
    * `gotKey`: Define a flag `F0` e retorna.
    * `zero` - `sejaB`, `row0`: Sub-rotinas usadas em `leituraTeclado` para determinar o valor da tecla pressionada com base na linha e coluna detectadas.
    * `escreveLCD`: Sub-rotina para escrever o caractere ASCII presente no acumulador (`A`) no display LCD na posição do cursor.
    * `lcd_init`: Sub-rotina para inicializar o display LCD com uma sequência de comandos específicos para configuração (modo de 8 bits, 2 linhas, fonte 5x7, display ligado, cursor desligado, piscar desligado, limpar display, definir modo de entrada).
    * `exibeScore`: Sub-rotina para exibir o rótulo "SCORE:" seguido do valor da variável `SCORE` no LCD.
    * `sendCharacter`: Sub-rotina para enviar um byte de dados (comando ou caractere) para o LCD, controlando os pinos `RS` e `EN`.
    * `posicionaCursor`: Sub-rotina para definir a posição do cursor no LCD, recebendo o endereço da posição desejada no acumulador (`A`).
    * `retornaCursor`: Sub-rotina para mover o cursor para a primeira linha, primeira coluna do LCD.
    * `clearDisplay`: Sub-rotina para limpar todo o display LCD e retornar o cursor para a posição inicial.
    * `delay`: Sub-rotina para gerar um pequeno atraso, com a duração controlada pelo valor inicial carregado no registrador `R7` e pelo loop interno.

## Notas

* Este código implementa um ciclo básico do jogo da memória: apresentação da sequência, leitura da tentativa do jogador e comparação.
* A lógica para gerar novas sequências aleatoriamente não está incluída nesta versão. A sequência a ser memorizada é predefinida na rotina `INICIO`.
* O mapeamento do teclado matricial na rotina `leituraTeclado` é específico para uma determinada configuração de hardware. Se a fiação do seu teclado for diferente, essa rotina precisará ser ajustada.
* O controle do LED verde em `CORRETO` é um feedback visual simples para o jogador.
* O jogo termina após uma sequência correta ou após o jogador esgotar suas tentativas em uma sequência incorreta. Uma versão mais avançada poderia incluir múltiplos níveis, pontuação cumulativa e geração dinâmica de sequências.
* As sub-rotinas de controle do LCD (`lcd_init`, `sendCharacter`, `posicionaCursor`, `clearDisplay`) são essenciais para a interface com o display.
