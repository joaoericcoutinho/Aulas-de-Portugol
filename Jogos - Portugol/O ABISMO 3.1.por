programa {
  inclua biblioteca Util --> u

  funcao inicio() {
    // Variáveis de Perfil
    cadeia nome, classe_nome = "", nome_inimigo = "", arma_nome = ""
    inteiro classe_escolha, arma_escolha, dificuldade
    real mult_inimigo = 1.0, mult_recompensa = 1.0
    
    // Status do Jogador
    inteiro vida_jogador, vida_max = 0
    inteiro mana, mana_max = 0
    inteiro ataque_jogador = 0, ataque_master = 0
    inteiro ouro = 0, xp = 0, xp_proximo = 100, nivel_player = 1
    
    // Status de Combate
    inteiro vida_inimigo, ataque_inimigo, opcao = 0, andar = 1
    inteiro sorteio_esquiva, sorteio_critico, chance_critico_classe = 8 

    escreva("##########################################################\n")
    escreva("#                                                        #\n")
    escreva("#               DUNGEON MASTER: O ABISMO                 #\n")
    escreva("#                                                        #\n")
    escreva("##########################################################\n")
    escreva(" Digite o nome do herói: ")
    leia(nome)

    limpa()
    escreva("\n--- SELECIONE A DIFICULDADE ---\n")
    escreva(" [1] FÁCIL   | [2] NORMAL | [3] DIFÍCIL | [4] PESADELO\n Escolha: ")
    leia(dificuldade)

    escolha(dificuldade) {
      caso 1: mult_inimigo = 0.7 mult_recompensa = 1.5 pare
      caso 2: mult_inimigo = 1.0 mult_recompensa = 1.0 pare
      caso 3: mult_inimigo = 1.5 mult_recompensa = 0.8 pare
      caso 4: mult_inimigo = 2.5 mult_recompensa = 0.5 pare
      caso contrario: mult_inimigo = 1.0 mult_recompensa = 1.0
    }

    limpa()
    escreva("\n==========================================================\n")
    escreva("                 TABELA DE ATRIBUTOS                      \n")
    escreva("==========================================================\n")
    escreva(" CLASSE       | HP  | MP  | ATK | HABILIDADE ESPECIAL     \n")
    escreva("----------------------------------------------------------\n")
    escreva(" 1) CAVALEIRO | 120 | 40  | 20  | Golpe de Escudo         \n")
    escreva(" 2) MAGO      | 70  | 120 | 10  | Explosão Arcana         \n")
    escreva(" 3) ASSASSINO | 80  | 50  | 25  | Ataque Furtivo          \n")
    escreva(" 4) ARQUEIRO  | 90  | 60  | 18  | Flecha Perfurante       \n")
    escreva(" 5) PALADINO  | 150 | 70  | 15  | Julgamento Sagrado      \n")
    escreva("==========================================================\n")
    escreva(" Escolha sua classe (1-5): ")
    leia(classe_escolha)

    escolha(classe_escolha) {
      caso 1: 
        vida_max = 120 mana_max = 40 ataque_jogador = 20 ataque_master = 45 classe_nome = "CAVALEIRO"
        escreva("\n ARMA: [1] Espada (+5 ATK) | [2] Escudo (+40 HP) | [3] Montante (+10% Crit)\n Opção: ")
        leia(arma_escolha)
        se(arma_escolha == 1) { ataque_jogador += 5 arma_nome = "Espada Longa" }
        senao se(arma_escolha == 2) { vida_max += 40 arma_nome = "Escudo Espinhoso" }
        senao { chance_critico_classe -= 1 arma_nome = "Montante" }
        pare
      caso 2: 
        vida_max = 70 mana_max = 120 ataque_jogador = 10 ataque_master = 90 classe_nome = "MAGO"
        escreva("\n ARMA: [1] Cajado (+30 MP) | [2] Grimório (+15 Magia) | [3] Varinha (+5 ATK)\n Opção: ")
        leia(arma_escolha)
        se(arma_escolha == 1) { mana_max += 30 arma_nome = "Cajado" }
        senao se(arma_escolha == 2) { ataque_master += 15 arma_nome = "Grimório" }
        senao { ataque_jogador += 5 arma_nome = "Varinha" }
        pare
      caso 3: 
        vida_max = 80 mana_max = 50 ataque_jogador = 25 ataque_master = 50 chance_critico_classe = 6 classe_nome = "ASSASSINO"
        escreva("\n ARMA: [1] Adagas (+20% Crit) | [2] Manto (+Esq) | [3] Lâmina (+8 ATK)\n Opção: ")
        leia(arma_escolha)
        se(arma_escolha == 1) { chance_critico_classe -= 2 arma_nome = "Adagas" }
        senao se(arma_escolha == 2) { chance_critico_classe -= 1 arma_nome = "Manto" }
        senao { ataque_jogador += 8 arma_nome = "Lâmina" }
        pare
      caso 4: 
        vida_max = 90 mana_max = 60 ataque_jogador = 18 ataque_master = 55 chance_critico_classe = 5 classe_nome = "ARQUEIRO"
        escreva("\n ARMA: [1] Arco (+10 ATK) | [2] Besta (+10% Crit) | [3] Aljava (+20 MP)\n Opção: ")
        leia(arma_escolha)
        se(arma_escolha == 1) { ataque_jogador += 10 arma_nome = "Arco" }
        senao se(arma_escolha == 2) { chance_critico_classe -= 1 arma_nome = "Besta" }
        senao { mana_max += 20 arma_nome = "Aljava" }
        pare
      caso 5: 
        vida_max = 150 mana_max = 70 ataque_jogador = 15 ataque_master = 40 classe_nome = "PALADINO"
        escreva("\n ARMA: [1] Martelo (+12 ATK) | [2] Relíquia (+50 MP) | [3] Armadura (+60 HP)\n Opção: ")
        leia(arma_escolha)
        se(arma_escolha == 1) { ataque_jogador += 12 arma_nome = "Martelo" }
        senao se(arma_escolha == 2) { mana_max += 50 arma_nome = "Relíquia" }
        senao { vida_max += 60 arma_nome = "Armadura" }
        pare
      caso contrario:
        vida_max = 110 mana_max = 80 ataque_jogador = 60 ataque_master = 85 classe_nome = "CAMPONÊS" arma_nome = "Enxada"
        escreva("\n [SISTEMA] Classe Secreta Habilitada! Boa sorte, mestre.\n")
        u.aguarde(1500)
    }
    
    vida_jogador = vida_max
    mana = mana_max

    enquanto (vida_jogador > 0) {
      limpa()
      se (andar % 5 == 0) {
        nome_inimigo = "!!! SENHOR DO ABISMO (BOSS) !!!"
        vida_inimigo = (80 + (andar * 40)) * mult_inimigo
        ataque_inimigo = (12 + (andar * 7)) * mult_inimigo
      } senao {
        inteiro m = u.sorteia(1, 4)
        se(m==1) nome_inimigo = "Verme de Sangue" senao se(m==2) nome_inimigo = "Espectro" senao se(m==3) nome_inimigo = "Aranha Tecelã" senao nome_inimigo = "Gnomo Ladino"
        vida_inimigo = (30 + (andar * 22)) * mult_inimigo
        ataque_inimigo = (5 + (andar * 4)) * mult_inimigo
      }
      
      escreva("\n >>> ENTRANDO NO ANDAR ", andar, " : ", nome_inimigo, " <<<\n")
      u.aguarde(1200)

      enquanto (vida_jogador > 0 e vida_inimigo > 0) {
        limpa()
        escreva("\n+-------------------------------------------------+")
        escreva("\n  ", nome, " [", classe_nome, " Lvl:", nivel_player, "] ")
        escreva("\n  HP: ", vida_jogador, "/", vida_max, " | MP: ", mana, "/", mana_max)
        escreva("\n  ARMA: ", arma_nome, " | OURO: ", ouro)
        escreva("\n  INIMIGO: ", nome_inimigo, " | HP: ", vida_inimigo)
        escreva("\n+-------------------------------------------------+")
        escreva("\n  [1] Atacar (Custo: 0 MP)")
        escreva("\n  [2] Especial (Custo: 25 MP)")
        escreva("\n  [3] Curar (Custo: 20 MP | Ganha: +35% HP)")
        escreva("\n  [4] Fugir (Custo: Metade do seu HP)")
        escreva("\n  Escolha: ")
        leia(opcao)

        se (opcao == 1) {
          se (u.sorteia(1, 10) > chance_critico_classe) {
            vida_inimigo -= (ataque_jogador * 2)
            escreva("\n  [!] CRÍTICO! Dano causado: ", (ataque_jogador * 2))
          } senao {
            vida_inimigo -= ataque_jogador
            escreva("\n  [!] Dano causado: ", ataque_jogador)
          }
        } senao se (opcao == 2) {
          se (mana >= 25) { 
            vida_inimigo -= ataque_master 
            mana -= 25 
            escreva("\n  [-] USOU ESPECIAL: -25 MP")
            escreva("\n  [!] Dano Massivo: ", ataque_master) 
          }
          senao { escreva("\n  [X] FALHA: Mana insuficiente!") }
        } senao se (opcao == 3) {
          se (mana >= 20) {
            inteiro vcura = vida_max * 0.35
            vida_jogador += vcura
            se (vida_jogador > vida_max) vida_jogador = vida_max
            mana -= 20
            escreva("\n  [-] USOU CURA: -20 MP")
            escreva("\n  [+] REGENEROU: +", vcura, " HP")
          } senao { escreva("\n  [X] FALHA: Mana insuficiente!") }
        } senao { 
          escreva("\n  [!] VOCÊ FUGIU! Perdeu metade do HP.")
          vida_jogador /= 2 
          u.aguarde(1000)
          pare 
        }

        se (vida_inimigo > 0) {
          u.aguarde(800)
          se (u.sorteia(1, 10) > 8) {
            escreva("\n  [*] ESQUIVA: Você desviou do golpe!")
          } senao { 
            vida_jogador -= ataque_inimigo 
            escreva("\n  [X] DANO: ", nome_inimigo, " acertou: -", ataque_inimigo, " HP") 
          }
          u.aguarde(1200)
        }
      }

      se (vida_jogador > 0) {
        limpa()
        inteiro ganho_xp = (35 + (andar * 10)) * mult_recompensa
        inteiro ganho_ouro = (15 + (andar * 5)) * mult_recompensa
        xp += ganho_xp
        ouro += ganho_ouro
        
        escreva("\n  ================ VITÓRIA! =================")
        escreva("\n  + ", ganho_xp, " XP")
        escreva("\n  + ", ganho_ouro, " OURO")
        escreva("\n  ===========================================\n")
        u.aguarde(1500)
        
        se (xp >= xp_proximo) {
          nivel_player++
          xp -= xp_proximo
          xp_proximo += 50
          ataque_jogador += 8
          
          escolha(classe_escolha) {
            caso 5: vida_max += 60 escreva("\n  >>> BÔNUS PALADINO: +60 Vida Máxima! <<<") pare
            caso contrario: mana_max += 25 vida_max += 20 escreva("\n  >>> BÔNUS CLASSE: +Status Up! <<<") pare
          }
          
          inteiro cura_up = vida_max * 0.50
          vida_jogador += cura_up
          se (vida_jogador > vida_max) vida_jogador = vida_max
          mana = mana_max

          escreva("\n  >>> LEVEL UP! Agora você é Nível ", nivel_player, " <<<")
          u.aguarde(2000)
        }

        se (andar % 5 == 0 e vida_jogador > 0) {
          limpa()
          escreva("\n  [ MERCADOR DO ABISMO ] 'Escolha bem...'")
          escreva("\n  Ouro: ", ouro)
          escreva("\n  [1] Poção Cura Total (50 Ouro) | [2] Amuleto ATK (130) | [3] Elixir Mana (80)")
          escreva("\n  [4] Pedra Afiar (100) | [5] Armadura (150) | [6] Sair")
          escreva("\n  Escolha: ")
          leia(opcao)

          se (opcao == 1 e ouro >= 50) { vida_jogador = vida_max ouro -= 50 }
          senao se (opcao == 2 e ouro >= 130) { ataque_jogador += 15 ouro -= 130 }
          senao se (opcao == 3 e ouro >= 80) { mana_max += 40 mana = mana_max ouro -= 80 }
          senao se (opcao == 4 e ouro >= 100) { ataque_master += 25 ouro -= 100 }
          senao se (opcao == 5 e ouro >= 150) { vida_max += 100 vida_jogador += 100 ouro -= 150 }
        }

        andar++
      }
    }

    limpa()
    escreva("\n##########################################################")
    escreva("\n#                 G A M E   O V E R                      #")
    escreva("\n#   O herói ", nome, " tombou no andar ", andar, "             #")
    escreva("\n##########################################################\n")
  }
}