## Descrição

O jogo da memória desenvolvido em linguagem Assembly consiste em uma versão simplificada do clássico jogo da memoria. A aplicação foi projetada para funcionar em ambiente de terminal e foi implementada com base nos princípios da programação de baixo nível, manipulando diretamente registradores, instruções aritméticas e controle de fluxo.

## Objetivo do Projeto

Este projeto tem como objetivo explorar a lógica de controle de fluxo, manipulação de dados em memória e interações básicas de entrada e saída utilizando linguagem de montagem. A implementação do jogo da memória serve como exercício prático para consolidar conhecimentos sobre o funcionamento interno do processador e como operações de alto nível são traduzidas para baixo nível.

## Mapeamento de Hardware

As seguintes conexões de hardware são definidas no código:

* **LCD RS:** P1.3
* **LCD EN:** P1.2
* **LCD Data (D4-D7):** P1.4 - P1.7
* **Teclado Matricial:** Conectado à Porta P0 (a configuração exata das linhas e colunas precisaria ser detalhada com o esquema de ligação do teclado).
* **LED (Sequência Correta):** Conectado aos pinos P1.4 - P1.7 (todos acesos indicam correto).

## Organização do Código

O código assembly é organizado nas seguintes rotinas principais:

* **`INICIO`:** Rotina de inicialização do sistema, incluindo configuração do Timer 0, geração da sequência inicial, inicialização do LCD e das variáveis do jogo.
* **`MAIN`:** Exibe a tela de boas-vindas e aguarda a entrada inicial do jogador.
* **`leitura0`:** Aguarda a pressão da tecla '1' para iniciar o jogo e gera uma nova sequência (potencialmente redundante).
* **`JOGO`:** Exibe a mensagem para memorizar a sequência e apresenta os dígitos da sequência no LCD. Inicia a rotina de entrada do jogador.
* **`ROTINA`:** Controla a leitura da entrada do jogador, exibindo o dígito a ser digitado, lendo a tecla, exibindo-a no LCD, armazenando-a e comparando-a com o dígito correto.
* **`COMPARACAO`:** Compara a sequência completa digitada com a sequência correta.
* **`CORRETO`:** Rotina executada quando a sequência está correta, fornece feedback visual e exibe a pontuação.
* **`DIFERENTE`:** Rotina executada quando a sequência está incorreta, fornece feedback e decrementa as tentativas.
* **`ERRO`:** Rotina para feedback de erro durante a digitação.
* **`RESET`:** Reinicializa as variáveis para uma nova tentativa da mesma sequência.
* **`FIM`:** Exibe a tela de fim de jogo com a pontuação final.
* **`GERA_ALEATORIO`:** Sub-rotina para gerar um número pseudoaleatório na faixa de 1 a 9.
* **`leituraTeclado`:** Sub-rotina principal para ler a entrada do teclado matricial.
* **`colScan`, `gotKey`, `zero`, `sejaB`, `row0`:** Sub-rotinas auxiliares para a leitura do teclado.
* **`escreveLCD`:** Sub-rotina para escrever um caractere no LCD em uma posição específica.
* **`lcd_init`:** Sub-rotina para inicializar o display LCD no modo de 4 bits.
* **`exibeScore`:** Sub-rotina para exibir a pontuação no LCD.
* **`sendCharacter`:** Sub-rotina para enviar um caractere ou comando para o LCD.
* **`posicionaCursor`:** Sub-rotina para definir a posição do cursor no LCD.
* **`retornaCursor`:** Sub-rotina para retornar o cursor à posição inicial do LCD.
* **`clearDisplay`:** Sub-rotina para limpar o display LCD.
* **`delay`, `delay_tecla`:** Sub-rotinas para gerar pequenos atrasos de tempo.
![Fluxograma](https://github.com/user-attachments/assets/0ef99327-335f-49ab-b10d-ad29f7af3ec1)

## Notas

* Este código implementa um ciclo básico do jogo da memória: apresentação da sequência, leitura da tentativa do jogador e comparação.
* O mapeamento do teclado matricial na rotina `leituraTeclado` é específico para uma determinada configuração de hardware. Se a fiação do seu teclado for diferente, essa rotina precisará ser ajustada.
* O controle do LED verde em `CORRETO` é um feedback visual simples para o jogador.
* O jogo termina após uma sequência correta ou após o jogador esgotar suas tentativas em uma sequência incorreta.
* As sub-rotinas de controle do LCD (`lcd_init`, `sendCharacter`, `posicionaCursor`, `clearDisplay`) são essenciais para a interface com o display.
