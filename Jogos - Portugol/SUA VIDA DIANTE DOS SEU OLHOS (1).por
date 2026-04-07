programa
{
  inclua biblioteca Util --> u
  
  // --- STATUS ---
  inteiro hp, hp_max, mana, mana_max, atk, def, moedas = 50, pocoes = 2
  inteiro lv = 1, exp = 0
  cadeia nome, classe = "", passiva = "", passiva_desc = "", hab_nome = ""
  cadeia elemento_p = "" 
  inteiro hab_dano = 30
  logico tem_montaria = falso, tem_pet = falso, tem_companheiro = falso

  funcao inicio()
  {
    prologo() 
    hp = hp_max
    mana = mana_max
    
    enquanto(hp > 0)
    {
      limpa()
      atualizar_habilidades_por_nivel()

      escreva("=== ELYRIA | LV: ", lv, " | ", classe, " [", elemento_p, "] ===\n")
      escreva("HP: ", hp, "/", hp_max, " | MP: ", mana, "/", mana_max, " | Ouro: ", moedas, "g\n")
      escreva("Habilidade Atual: ", hab_nome, " (Dano Base: ", hab_dano, ")\n")
      escreva("----------------------------------------------------------\n")
      escreva("1. EXPLORAR VILA              | 2. DUNGEON\n")
      escreva("3. CAPITAL REAL (Guilda/Arena)| 4. BOSS FINAL (LV 100)\n")
      escreva("5. MERCADO E EQUIPAMENTOS     | 6. STATUS DETALHADO\n")
      escreva("7. VIAJAR PARA PRÓXIMA CIDADE |\n")
      escreva("Escolha: ")
      inteiro destino
      leia(destino)

      escolha(destino)
      {
        caso 1: vila_oakheart() pare
        caso 2: dungeon_procedural() pare
        caso 3: capital_real() pare
        caso 4: 
          se(lv >= 100) { combate("DRAGÃO SUPREMO", 2500, 110, 0, 0, "FOGO") }
          senao { escreva("\nVocê é fraco demais! O Boss Final só surge no Nível 100.") u.aguarde(2000) }
          pare
        caso 5: descansar() pare
        caso 6: status_detalhado() pare
        caso 7: viajar_proxima_cidade() pare
      }
      
      se(nao tem_montaria e hp > 0) { 
        inteiro dano_cansaco = 2
        se(passiva == "Adaptável") { dano_cansaco = 1 }
        hp = hp - dano_cansaco
        se(hp <= 0) { hp = 1 escreva("\nVocê está exausto! Vá descansar.") u.aguarde(1000) }
      }
    }
    escreva("\nGAME OVER. Sua alma retorna ao ciclo da reencarnação.")
  }

  funcao atualizar_habilidades_por_nivel()
  {
    se(classe == "Mago") {
      se(lv < 10) { hab_nome = "Meteoro" hab_dano = 55 }
      senao se(lv < 30) { hab_nome = "Supernova" hab_dano = 95 }
      senao se(lv < 50) { hab_nome = "Vácuo Arcano" hab_dano = 150 }
      senao { hab_nome = "Gênesis Elemental" hab_dano = 320 }
    }
    senao se(classe == "Espadachim") {
      se(lv < 10) { hab_nome = "Corte Divisor" hab_dano = 32 }
      senao se(lv < 30) { hab_nome = "Lâmina de Luz" hab_dano = 65 }
      senao se(lv < 50) { hab_nome = "Dança das Mil Lâminas" hab_dano = 110 }
      senao { hab_nome = "Corte Dimensional" hab_dano = 240 }
    }
    senao se(classe == "Assassino") {
      se(lv < 10) { hab_nome = "Apunhalar" hab_dano = 48 }
      senao se(lv < 30) { hab_nome = "Sombra Fatal" hab_dano = 82 }
      senao se(lv < 50) { hab_nome = "Execução Silenciosa" hab_dano = 135 }
      senao { hab_nome = "Ceifador de Almas" hab_dano = 290 }
    }
    senao se(classe == "Arqueiro") {
      se(lv < 10) { hab_nome = "Flecha Perfurante" hab_dano = 38 }
      senao se(lv < 30) { hab_nome = "Chuva de Flechas" hab_dano = 72 }
      senao se(lv < 50) { hab_nome = "Disparo de Ártemis" hab_dano = 120 }
      senao { hab_nome = "Flecha do Juízo Final" hab_dano = 260 }
    }
    senao se(classe == "Tanque") {
      se(lv < 10) { hab_nome = "Impacto de Escudo" hab_dano = 22 }
      senao se(lv < 30) { hab_nome = "Terremoto" hab_dano = 55 }
      senao se(lv < 50) { hab_nome = "Fortaleza Móvel" hab_dano = 95 }
      senao { hab_nome = "Ira dos Titãs" hab_dano = 200 }
    }
    senao se(classe == "Lanceiro") {
      se(lv < 10) { hab_nome = "Estocada Letal" hab_dano = 42 }
      senao se(lv < 30) { hab_nome = "Perfuração em Espiral" hab_dano = 78 }
      senao se(lv < 50) { hab_nome = "Lança de Longinus" hab_dano = 130 }
      senao { hab_nome = "Dragão Ascendente" hab_dano = 275 }
    }
  }

  funcao prologo() 
  {
    escreva("Você morreu… mas eu lhe concederei uma segunda chance. Diga-me seu nome, ó Escolhido: ") 
    leia(nome)
    limpa()
    escreva("EU VOU LHE OFERECER ALGUMAS HABILIDADES...\n")
    u.aguarde(2000)

    cadeia elem1, elem2 = "", elem3 = ""
    elem1 = sortear_um_elemento()
    elemento_p = elem1
    
    se(u.sorteia(1, 100) <= 60) {
        faca { elem2 = sortear_um_elemento() } enquanto (elem2 == elem1)
        elemento_p = elemento_p + " / " + elem2
        se(u.sorteia(1, 100) <= 40) {
            faca { elem3 = sortear_um_elemento() } enquanto (elem3 == elem1 ou elem3 == elem2)
            elemento_p = elemento_p + " / " + elem3
        }
    }

    inteiro r = u.sorteia(1, 10)
    inteiro b_hp = 0, b_atk = 0, b_def = 0, b_mana = 0
    escolha(r) {
      caso 1: passiva = "Sabedoria" passiva_desc = "+30 MP e +5 ATK." b_mana = 30 b_atk = 5 pare
      caso 2: passiva = "Leitor" passiva_desc = "+15 ATK (Conhecimento do Mundo)." b_atk = 15 pare
      caso 3: passiva = "Crescimento" passiva_desc = "+20 HP e Bônus de XP." b_hp = 20 b_atk = 5 pare
      caso 4: passiva = "Adaptável" passiva_desc = "+10 DEF e Menos Cansaço." b_def = 10 b_hp = 20 pare
      caso 5: passiva = "Sortudo" passiva_desc = "Começa com 150 de Ouro." moedas = 150 pare
      caso 6: passiva = "Mente Paralela" passiva_desc = "+80 MP e Magias Baratas." b_mana = 80 pare
      caso 7: passiva = "Regeneração" passiva_desc = "+40 HP e Cura ao dormir." b_hp = 40 pare
      caso 8: passiva = "Instinto" passiva_desc = "+15 DEF e Reflexos Rápidos." b_def = 15 pare
      caso 9: passiva = "Elemental" passiva_desc = "+40 MP e Dano Elemental Forte." b_mana = 40 b_atk = 10 pare
      caso 10: passiva = "Protagonista" passiva_desc = "Bônus em Todos os Atributos." b_hp = 30 b_atk = 10 b_def = 5 pare
    }

    escreva("==========================================================\n")
    escreva(" ELEMENTOS DEFINIDOS: ", elemento_p, "\n")
    escreva(" PASSIVA CONCEDIDA: ", passiva, "\n")
    escreva(" EFEITO: ", passiva_desc, "\n")
    escreva("==========================================================\n")
    escreva("\nPressione Enter para ver as classes disponíveis...")
    cadeia skip leia(skip)

    inteiro c = 0
    enquanto(c < 1 ou c > 6) {
      limpa()
      escreva("--- TABELA DE CLASSES DISPONÍVEIS ---\n")
      escreva("1. MAGO       | HP: 90  | ATK: 30 | MP: 180 \n")
      escreva("2. ESPADACHIM | HP: 150 | ATK: 22 | MP: 60  \n")
      escreva("3. ASSASSINO  | HP: 110 | ATK: 28 | MP: 75  \n")
      escreva("4. ARQUEIRO   | HP: 120 | ATK: 25 | MP: 85  \n")
      escreva("5. TANQUE     | HP: 230 | ATK: 14 | MP: 50  \n")
      escreva("6. LANCEIRO   | HP: 145 | ATK: 23 | MP: 60  \n")
      escreva("----------------------------------------------------------\n")
      escreva("Escolha o número da sua classe: ")
      leia(c)
    }

    escolha(c) {
      caso 1: classe = "Mago" hp_max = 90+b_hp atk = 30+b_atk def = 5+b_def mana_max = 180+b_mana pare
      caso 2: classe = "Espadachim" hp_max = 150+b_hp atk = 22+b_atk def = 15+b_def mana_max = 60+b_mana pare
      caso 3: classe = "Assassino" hp_max = 110+b_hp atk = 28+b_atk def = 8+b_def mana_max = 75+b_mana pare
      caso 4: classe = "Arqueiro" hp_max = 120+b_hp atk = 25+b_atk def = 11+b_def mana_max = 85+b_mana pare
      caso 5: classe = "Tanque" hp_max = 230+b_hp atk = 14+b_atk def = 26+b_def mana_max = 50+b_mana pare
      caso 6: classe = "Lanceiro" hp_max = 145+b_hp atk = 23+b_atk def = 13+b_def mana_max = 60+b_mana pare
    }
  }

  funcao cadeia sortear_um_elemento() {
      inteiro seletor = u.sorteia(1, 8)
      escolha(seletor) {
        caso 1: retorne "FOGO" caso 2: retorne "ÁGUA" caso 3: retorne "TERRA"
        caso 4: retorne "VENTO" caso 5: retorne "LUZ" caso 6: retorne "ESCURIDÃO"
        caso 7: retorne "GELO" caso 8: retorne "RAIO"
      }
      retorne ""
  }

  funcao capital_real()
  {
    limpa()
    escreva("--- CAPITAL REAL DE ELYRIA ---\n")
    escreva("1. Arena (Treino +20 XP)\n")
    escreva("2. GUILDA DE AVENTUREIROS (Quadro de Missões)\n")
    escreva("3. Altar Divino (Trocar Elemento - 100g)\n")
    escreva("4. Voltar\n")
    inteiro op leia(op)
    escolha(op){
      caso 1: exp += 20 escreva("\nTreino finalizado!") u.aguarde(800) pare
      caso 2: quadro_missoes() pare
      caso 3: trocar_elemento() pare
    }
  }

  funcao quadro_missoes()
  {
    limpa()
    escreva("--- QUADRO DE MISSÕES ---\n")
    escreva("1. [FÁCIL] Caçar Goblins (40g | 30 XP)\n")
    escreva("2. [MÉDIO] Escortar Caravana (100g | 80 XP)\n")
    escreva("3. [DIFÍCIL] Matar Ogro Corrompido (250g | 200 XP)\n")
    escreva("4. Voltar\n")
    inteiro mis leia(mis)
    escolha(mis){
      caso 1: combate("Goblins", 100, 15, 30, 40, "TERRA") pare
      caso 2: combate("Ladrões", 250, 40, 80, 100, "VENTO") pare
      caso 3: combate("Ogro Corrompido", 650, 70, 200, 250, "ESCURIDÃO") pare
    }
  }

  funcao viajar_proxima_cidade()
  {
    limpa()
    escreva("--- PORTÃO DE VIAGEM ---\n")
    escreva("Destino: Cidade Gélida de Frosthaven\n")
    escreva("Requisito: Nível 15\n")
    se(lv >= 15) { escreva("\n[AUTORIZADO] Você viajou para Frosthaven!") } 
    senao { escreva("\n[NEGADO] O guarda te empurra: 'Você é muito inexperiente!'") }
    u.aguarde(2500)
  }

  funcao trocar_elemento()
  {
    se(moedas >= 100){
      moedas -= 100
      elemento_p = sortear_um_elemento()
      escreva("\nSua essência agora é: ", elemento_p)
    } senao { escreva("\nSem ouro suficiente!") }
    u.aguarde(1000)
  }

  // --- FUNÇÃO DE COMBATE COM RELATÓRIO DE DANO ---
  funcao combate(cadeia in_nome, inteiro in_hp_max, inteiro in_atk, inteiro r_xp, inteiro r_ouro, cadeia in_elem)
  {
    inteiro in_hp = in_hp_max
    real mult_p = 1.0
    inteiro custo_mp = 35
    inteiro dano_causado = 0
    inteiro dano_sofrido = 0
    
    se(passiva == "Mente Paralela" ou passiva == "Elemental") { custo_mp = 25 }

    se(elemento_p == "FOGO" e in_elem == "GELO") mult_p = 1.6
    senao se(elemento_p == "RAIO" e in_elem == "ÁGUA") mult_p = 1.6
    senao se(elemento_p == "GELO" e in_elem == "TERRA") mult_p = 1.6
    senao se(elemento_p == "ÁGUA" e in_elem == "FOGO") mult_p = 1.6
    senao se(elemento_p == "LUZ" e in_elem == "ESCURIDÃO") mult_p = 1.6

    enquanto(hp > 0 e in_hp > 0)
    {
      limpa()
      escreva("⚔️ ", in_nome, " [", in_elem, "] | HP: ", in_hp, "/", in_hp_max, "\n")
      escreva(nome, " | HP: ", hp, "/", hp_max, " | MP: ", mana, "\n")
      escreva("----------------------------------------------------------\n")
      escreva("1. ATACAR | 2. ", hab_nome, " (", custo_mp, " MP) | 3. FOCO (+25 MP) | 4. POÇÃO\n")
      inteiro ac leia(ac)
      
      escolha(ac){
        caso 1: 
          dano_causado = (u.sorteia(atk, atk+10)) * mult_p
          in_hp -= dano_causado
          escreva("\n>> Você atacou e causou ", dano_causado, " de dano!")
          pare
        caso 2: 
          se(mana >= custo_mp){ 
            mana -= custo_mp 
            dano_causado = (atk + hab_dano) * mult_p
            in_hp -= dano_causado
            escreva("\n>> Você usou ", hab_nome, " e causou ", dano_causado, " de dano!")
          } senao { escreva("\n>> Sem mana suficiente!") dano_causado = 0 }
          pare
        caso 3: 
          mana += 25 
          se(mana > mana_max) mana = mana_max 
          escreva("\n>> Você se concentrou... MP recuperado!")
          dano_causado = 0
          pare
        caso 4: 
          se(pocoes > 0){ 
            pocoes-- 
            hp += 50 
            se(hp > hp_max) hp = hp_max 
            escreva("\n>> Você usou uma poção e recuperou HP!")
          } senao { escreva("\n>> Sem poções!") }
          dano_causado = 0
          pare
      }

      u.aguarde(2000) // Pausa para ler o seu dano

      se(in_hp > 0){ 
        dano_sofrido = in_atk - (def/4)
        se(dano_sofrido < 2) dano_sofrido = 2
        hp -= dano_sofrido 
        escreva("\n>> ", in_nome, " contra-atacou e te causou ", dano_sofrido, " de dano!")
        u.aguarde(2000) // Pausa para ler o dano do inimigo
      }
    }

    se(hp > 0) {
      moedas += r_ouro exp += r_xp
      escreva("\nVITÓRIA! +", r_ouro, "g e +", r_xp, " XP.")
      u.aguarde(1500)
      se(exp >= 100){ lv++ exp = 0 hp_max += 25 atk += 3 def += 2 hp = hp_max escreva("\nLEVEL UP! Nível ", lv) u.aguarde(1000) }
    }
  }

  funcao descansar() {
    limpa()
    escreva("--- MERCADO DE ELYRIA (15 ITENS) ---\n")
    escreva("1. Dormir (15g)           | 2. Poção Vida (20g)     | 3. Amolar (+5 ATK-40g)\n")
    escreva("4. Armadura (+5 DEF-40g)  | 5. Fruta (+20 HP-60g)   | 6. Elixir (+30 MP-60g)\n")
    escreva("7. Cavalo (Montaria-200g) | 8. Pet (+10 DEF-150g)   | 9. Luvas (+10 ATK-120g)\n")
    escreva("10. Anel (+15 ATK/DEF-300g)| 11. XP Booster (100g)  | 12. Escudo (+8 DEF-80g)\n")
    escreva("13. Capa (+15 DEF-180g)   | 14. Livro (+50 MP-150g) | 15. Espada Real (+25 ATK-400g)\n")
    escreva("16. Voltar\n")
    inteiro comp leia(comp)
    escolha(comp){
      caso 1: se(moedas>=15){ moedas-=15 hp=hp_max mana=mana_max se(passiva=="Regeneração"){ hp_max += 2 } } pare
      caso 2: se(moedas>=20){ moedas-=20 pocoes++ } pare
      caso 3: se(moedas>=40){ moedas-=40 atk+=5 } pare
      caso 4: se(moedas>=40){ moedas-=40 def+=5 } pare
      caso 5: se(moedas>=60){ moedas-=60 hp_max+=20 } pare
      caso 6: se(moedas>=60){ moedas-=60 mana_max+=30 } pare
      caso 7: se(moedas>=200){ moedas-=200 tem_montaria=verdadeiro } pare
      caso 8: se(moedas>=150){ moedas-=150 tem_pet=verdadeiro def+=10 } pare
      caso 9: se(moedas>=120){ moedas-=120 atk+=10 } pare
      caso 10: se(moedas>=300){ moedas-=300 atk+=15 def+=15 } pare
      caso 11: se(moedas>=100){ moedas-=100 exp+=60 } pare
      caso 12: se(moedas>=80){ moedas-=80 def+=8 } pare
      caso 13: se(moedas>=180){ moedas-=180 def+=15 } pare
      caso 14: se(moedas>=150){ moedas-=150 mana_max+=50 } pare
      caso 15: se(moedas>=400){ moedas-=400 atk+=25 } pare
    }
  }

  funcao vila_oakheart() 
  {
    limpa()
    escreva("--- EXPLORANDO OAKHEART ---\n")
    u.aguarde(1000)
    inteiro evento = u.sorteia(1, 12) 
    escolha(evento) {
      caso 1: escreva("\nVocê encontrou 5 moedas de ouro no chão!") moedas += 5 pare
      caso 2: escreva("\nVocê ajudou um idoso com a carga. Ganhou 10 de XP!") exp += 10 pare
      caso 3: escreva("\nUm batedor de carteiras te roubou 5 moedas!") moedas -= 5 pare
      caso 4: escreva("\nUm homem encapuzado te encara e some nas sombras: 'O Rei Demônio despertará...'") pare
      caso 5: escreva("\nVocê vê uma marca roxa em uma porta: 'A Sombra do Abismo está aqui'.") pare
      caso 6: escreva("\nUm bêbado grita: 'O Rei Demônio vai acordar e todos vocês cairão!'") pare
      caso 7: escreva("\nVocê encontra um diário perdido mencionando rituais de ressurreição.") pare
      caso 8: escreva("\nGuardas estão tensos. Dizem que a Organização planeja algo na Capital.") pare
      caso 9: escreva("\nVocê vê um vulto correndo. Ao investigar, encontra uma adaga com o símbolo do Abismo.") pare
      caso 10: escreva("\nUma criança pede ajuda. Você dá 2 moedas a ela e se sente revigorado (+5 XP).") moedas -= 2 exp += 5 pare
      caso 11: escreva("\nVocê encontra um cartaz: 'RECOMPENSA: Mantenha-se longe dos cultistas'.") pare
      caso 12: escreva("\nA vila parece pacífica, mas o silêncio é desconfortável.") pare
    }
    u.aguarde(2500)
  }

  funcao dungeon_procedural() 
  { 
    limpa()
    escreva("--- ENTRANDO NA DUNGEON ---\n")
    u.aguarde(1000)
    inteiro perigo = u.sorteia(1, 100)
    se(perigo <= 15) {
      inteiro dano_armadilha = u.sorteia(20, 50)
      escreva("\n[ARMADILHA] Flechas atingem você! Perdendo ", dano_armadilha, " de HP.")
      hp -= dano_armadilha
      u.aguarde(2500)
    }
    senao se(perigo <= 30) {
      escreva("\n[MIMICO] Você tentou abrir um baú, mas ele tem DENTES!")
      u.aguarde(1500)
      combate("Mímico Faminto", 200 + (lv * 10), 40 + lv, 150, 100, "TERRA")
    }
    senao {
      combate("Monstro Errante", 150+(lv*20), 30+lv, 70, 50, "ALEATÓRIO") 
    }
  }
  
  funcao status_detalhado() {
    limpa()
    escreva("--- STATUS DE ", nome, " ---\n")
    escreva("CLASSE: ", classe, " | ELEMENTOS: ", elemento_p, " | PASSIVA: ", passiva, "\n")
    escreva("ATK: ", atk, " | DEF: ", def, " | LV: ", lv, "\n")
    escreva("\n[Pressione Enter para voltar]")
    cadeia ok leia(ok)
  }
}
