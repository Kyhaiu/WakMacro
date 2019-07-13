# WakMacro
Macro para colheita, plantio e corte de recursos no jogo Wakfu.

1 - Motivação: O motivo pelo qual eu quis criar uma macro para coleta de recursos no jogo wakfu foi simplesmente um desafio pessoal. Para
obtenção de novos conhecimentos, e claro, a otimização de tempo no jogo(Evitar a parte de grind de recursos)

AVISOS: ESSA MACRO NÃO É UM BOT, POIS A MESMA PRECISA SER ASSISTIDA PELO USUÁRIO A RESOLVER O CAPTCHA DO JOGO. E TAMBÉM A MESMA NÃO POSSUI NENHUMA INTELIGÊNCIA, APENAS MOVIMENTOS LOGICAMENTE REPETIDOS.

2 - Legalidade: Sim uma macro é permitida em todos os jogos de RPG. Continue lendo que você entendera o porque
    2.1 - Segurança: Antes de falarmos sobre qualquer outra coisa sobre a macro. É preciso saber se ela é segura. E como saber, bom ela é segura, pois a mesma simula ações realizadas pelo Teclado/Mouse. Tanto que a ela literalmente meche o seu mouse enquanto ela executa.
    2.1.1 - É passivel de alguma punição por conta de algum anti-cheat? Não, pois a linguagem/biblitecas que eu utilizei no projeto são projetadas para criação de rotinas que realizam movimentos com o mouse e digitação de caractéres, ou seja enquanto a macro está sendo executada, seu computador é tomado por ela, pois a mesma realiza as mesmas ações que um usuário realizaria.(Caso queira saber qual linguagem foi utilizada de uma olhada no item ). E como dito anteriormente a macro não foi concebida para operar 24Horas sem parar, pois a mesma necessita que o usuário intervenha em alguns momentos.
    2.1.2 - É Passivel de punição por algum staff(administrador) do jogo? Muito improvavel, pois como dito anteriormente a macro não é um bot. Ou seja, você ainda precisa realizar a batalha que prova que  não é uma maquina que está jogando na sua conta(BOT). Mesmo se alguém for conversar com você durante o jogo é só pausar fechar a macro e responde-lo.

AVISOS SOBRE A MACRO: 
 1° - PARA ELA FUNCIONAR ADEQUADAMENTE, A RESOLUÇÃO DA TELA DEVE ESTAR EM 1366 X 768, POIS É A RESOLUÇÃO DA TELA DO MEU NOTEBOOK, E EU SÓ USO ELE PRA COISAS DA FACULDADE.
 2° - AS CONFIGURAÇÕES DO JOGO DEVEM SER
      JOGABILIDADE: DESMARCAR A OPÇÃO DE PERMITIR A INTERAÇÃO COM O BOTÃO ESQUERDO
                    MARCAR A OPÇÃO QUE PERMITE COLOCAR SEMENTES E GRÕES NA BARRA DE ATALHO
                    MARCAR A OPÇÃO DE CORRIDA AUTOMATICA
      VIDEO: EM EXIBIR VC SELECIONA A OPÇÃO "ENQUADRADO"
             MARCAR: ATIVAR SINCRONIZAÇÃO VERTICAL
             MARCAR: ATIVAR CLASSIFICAÇÃO DE ELEMENTOS MÓVEIS
             MARCAR: CAMERA FIXA
             
     E SEMPRE DEIXAR NO ZOOM MAXIMO!!!!
3 - Funcionamento da Macro
  3.1 - Não entrarei em detalhes tecnicos de como ela funciona, pois estou disponibilizando o código fonte para adequações/modificações. Então se quiser descobrir como ela funciona, dé uma olhada no código fonte. Acredito que esteja bem identado, e com nomenclatura memonica de funcões e variáveis.
  3.1.2 - A Linguagem utilizada na macro foi a AutoIt, é uma linguagem muito simples e fácil de se entender, pois a mesma está bem documentada.
  3.1.2.1 - Como modificar/editar a macro? Bom para isso basta baixar o instalador completo disponibilizado no site da linguagem: https://www.autoitscript.com/site/autoit/downloads/ , baixe o "AutoIt Full Installation", pois o mesmo já vem com todas as ferramentas que você irá precisar.
   3.2 - Como baixar? Basta clicar em Clone or Download, e bom depois em Download .ZIP
   3.3 - Antes de Executar, você precisa configurar os paramentros no arquivo "config.ini"
   3.3.1 -  Parametros:
                    Exit_Key = Tecla para cancelar a macro durante a sua execução(para muda-la você terá que consultar a documentação da função que utiliza ela)
                    Pause_Key= Mesma funcionalidade do 1° parametro, porém ao invés de fechar ela "Pausa a macro"
                    Area_Width= Largura da area
                    Area_Height= Altura da area
                    Harvest= Parametro responsavel por executar a rotina de colheita de sementes
                    Cut= Paramentro responsavel por executar a rotina de recolhimento de recursos
                    Replant= Prametro responsavel por executar a rotina de plantação/replantação de uma area
                    Hot_Key_Replant= Atalho para acessar o item que você deseja plantar(Usado somente quando for plantar)
                    Attemps= Paramentro responsavel por indicar quantas tentativas de plantio deseja realizar
                    Time_To_Walk= Tempo de caminhar entre um quadrado vizinho (Norte, Sul, Leste, Oeste)
                    Time_To_Plant= Tempo de plantio
                    Time_To_Harvets= Tempo de colheita de sementes
                    Time_To_Cut= Tempo de recolhimento da recurso
                    Repeat_Process= Parametro define quantas vezes você deseja realizar as rotinas da macro
                    
  Obs.: Os paramentros Harvest, Cut, Replant podem assumir dois valores apenas: True ou False, o parametro Hot_Key_Replant deve indicar em qual atalho está vinculado o item(igual as skills em combate), o parametro Attemps indica quantas vezes você deseja tentar plantar um recurso em um quadrado(se a chance for de 70% entre 2 a 3 tentativas, se for 30% entre 5 e 8 tentativas), o a unidade de medida do tempo é em miliseconds(ms) relembrando que 1000ms = 1s. ATENÇÃO AO TEMPO DE PLANTIO E COLHEITA DE CADA RECURSO.
  Obs. 2: para plantar, você precisa setar os paramentros Harvest e Cut como False caso deseje plantar alguma coisa utilizando a macro.
  
  3.4 -  Como ela movimenta o char: Na posição inicial ela movimenta da direita para a esquerda de baixo pra cima. Muito confuso? então deixe-me explicar através de imagens.:
         Posição inicial: https://imgur.com/gallery/T1qztwI
         Da direita para a esquerda: https://imgur.com/gallery/oCbY8Kq
         De baixo para cima: https://imgur.com/gallery/UIoGTwz
         
         NORTE, SUL, LESTE, OESTE para a macro: https://imgur.com/gallery/iEIG23q
  
  3.5 - Preparando o terreno: Basta achar uma area que de para plantar recursos, certificar-se que não tenha nenhum player por perto(PET'S não tem problema)
  3.6 - Após configurar o arquivo e achar um terreno, agora basta executar a macro e clicar em Start, caso tenha alguma duvida de como usa-la basta seguir as instruções que ela contem.

4 - NÃO ABUSE DELA, E PODE COMPARTILHAR COM QUE VOCÊ QUISER. E CLARO EDITAR TAMBÉM

5 - Como editar: Bom para edita-la, basta você ser criativo e usar o AutoIt Windows Info, essa ferramente te da as corrdenadas da tela(só não esquece de ativar a opção "Magnify" em configurações, qualquer coisa veja esse vídeo, foi come ele que eu aprendi a usar a linguagem https://www.youtube.com/watch?v=VE5zJanYiUw&t=208s , quanto a IDE usada para programar foi a SciTE Script Editor(ela vem no pacote de instalação do AutoIt) e pra executar vc aperta F5 na IDE(e o debug é da maneira raiz). Qualquer dúvida pode me procurar na guild Confraria do Trevo, ou entrar no discord dela https://discordapp.com/invite/CF2xBRg e mandar uma mensagem no pvt para o Autista

P.S.: Esse meu nick no discord me define bem :P

Trivias sobre o projeto:
Esse projeto foi criado para passar o tempo das férias da faculdade, assim como o fato de eu começar a jogar. Então é provavel que eu pare entre agosto e dezembro, por conta da faculdade/gadear/projetos pessoais.
Quanta XP ela rende por hora? Quanto recurso ela gera? Quantos gatinhos aparecem por hora? e outras duvidas esse video tem a resposta: https://www.youtube.com/watch?v=9U3OyyDlsi0 obviamente ele não tem 1 hora de duração.
E se vc está se perguntando se tem como fazer um BOT 100% automatico. A resposta é SIMMMMMM. E não é muito complicado, quando se tem o conhecimento necessário. E sim eu fiz um BOT pro Wakfu, porém ele viola os termos do jogo, então NÃO não irei disponibiliza-lo. Pois Wakfu é um jogo grande e com muita coisa para se fazer e acima de tudo, uma comunidade boa, coisa RARA hoje em dia em jogos de RPG.
  Mas se você meu caro padawan quiser tentar fazer um BOT 100% automatico, eu lhe dou uma colher de chá :) A parte de atomatização é simplismente igual, porem ao invés de clicar em pontos especificos na tela, vc procura por esses pontos(procuro recursos na tela), quanto ao puzzle do GATINHOOOOOOOOOOOOOOOO, bom basta usar um I.A. treinada para resolver o puzzle, no meu caso eu usei um pouco de paralelismo para acelelar o processo de identificação dos blocos que devem ser quebrados e apliquei um conceito de um experimento de física quantica(SIM OLHA AS BRISA QUE EU TAVA) Eu peguei varias imagens do mesmo numero no quadradinho e fui combinando elas e eliminando as partes que elas não tinham em comum, resultado? eu reduzi em 40% a area que eu preciso buscar, o que rende uns 20 seg de otimização e uns 30% a mais de acerto. E se você está se perguntando se eu irei utiliza-la, a resposta é SIM, porém somente em periodos de tempo onde eu estou ocupado com outra atividade. Ou seja de AGOSTO A DEZEMBRO MUUUUHAHAHHAHAHAHAHAHAHAHAHAHAH, brincadeira irei usar somente quando as aulas voltarem e provavelmente será até eu conseguir um char lvl 200, depois eu volto pro Warframe :p
    
