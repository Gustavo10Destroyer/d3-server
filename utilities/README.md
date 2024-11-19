# utilities
Nesta pasta ficam todos os arquivos do núcleo.
Esses arquivos são as "classes" e seus métodos.

## perks
- perk.gsc | A classe Perk.
- perk_machine.gsc | A classe Perk Machine.
A separação da vantagem e da máquina de vendas existe para:
- Permitir que o desenvolvedor crie seu próprio sistema de vendas.
- Permitir que o desenvolvedor crie uma vantagem que não tem uma máquina de vendas.
- Permitir que cada parte seja trabalhada separadamente e com calma.

## perks - perk.gsc
Esse arquivo é responsável por registrar a vantagem.
Ao registrar a vantagem, você fornece informações essenciais sobre ela, tais quais como:
- ID: string (uma identificação única)
- Shader: string (o shader/ícone que vai aparecer na tela)
- Callbacks: function_ptr (funções que serão chamadas quando a respectiva ação for realizada)

## perks - perk_machine.gsc
Esse arquivo é responsável por criar a máquina de vendas das vantagens.
Ao criar uma vantagem, você só consegue dar aquela vantagem à um jogador via script.
Esse utilitário existe para que não fique um processo tão chato e repetitivo criar uma máquina de vendas para cada vantagem.
O objetivo é criar uma forma padrão de máquinas de vendas, mas não obrigando o desenvolvedor a usá-la.