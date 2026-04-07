programa
{
  inclua biblioteca Util --> u
  
  funcao inicio()
  {
    // --- STATUS E VARIÁVEIS ---
    cadeia nome = "", cla = "", tecnica = "", dominio = "", raridade = "", rank = "4º Grau"
    cadeia passiva_nome = "", passiva_desc = "" // Variáveis para Passiva
    inteiro hp_max = 0, hp = 0, en_max = 0, en = 0
    inteiro atk = 0, con = 0, res = 0
    inteiro cap = 1, ienes = 200, exp = 0, lvl = 1 
    
    // --- VARIÁVEIS DE SISTEMA ---
    inteiro tent = 3, sorteio_raridade = 0, sorteio_tec = 0
    cadeia conf = "", tecla = ""
    logico dominio_ativo = falso
    logico dominio_inimigo_ativo = falso // Nova variável para controle do inimigo
    
    // Variáveis de Itens
    inteiro item_espada = 0, item_armadura = 0, item_amuleto = 0

    // Variáveis de Votos Únicos
    logico v1=falso, v2=falso, v3=falso, v4=falso, v5=falso, v6=falso, v7=falso, v8=falso

    escreva("--- 🏯 JUJUTSU KAISEN: Era Heian 🏯 ---\n")
    escreva("Qual é o seu nome mesmo feiticeiro: ")
    leia(nome)

    // --- GACHA DE CLÃ ---
    enquanto (tent > 0) {
      limpa()
      sorteio_raridade = u.sorteia(1, 100) 
      se (sorteio_raridade <= 20) { 
        raridade = "LENDÁRIO 🟡"
        inteiro r = u.sorteia(1, 3)
        se (r == 1) { cla = "Gojo" dominio = "Vazio Imensuravel" } 
        senao se (r == 2) { cla = "Fushiguro (Restricao)" dominio = "Nenhum (Restricao)" }
        senao { cla = "Sugawara (Ancestral)" dominio = "Templo do Crepusculo" }
      }
      senao se (sorteio_raridade <= 40) { 
        raridade = "ÉPICO 🟣"
        inteiro r = u.sorteia(1, 3)
        se (r == 1) { cla = "Okkotsu" dominio = "Amor Autentico Mutuo" } 
        senao se (r == 2) { cla = "Itadori" dominio = "Santuario Malevolente" }
        senao { cla = "Zen'in Hei (Elite)" dominio = "Palacio das Sombras" }
      }
      senao se (sorteio_raridade <= 50) { 
        raridade = "RARO 🔵"
        inteiro r = u.sorteia(1, 4)
        se (r == 1) { cla = "Zenin" dominio = "Jardim das Sombras Quimericas" } 
        senao se (r == 2) { cla = "Nanami" dominio = "Proporcao Divina" } 
        senao se (r == 3) { cla = "Choro" dominio = "Horizonte de Sangue" }
        senao { cla = "Hazenoki" dominio = "Carnificina Explosiva" }
      }
      senao { 
        raridade = "COMUM 🟢"
        inteiro r = u.sorteia(1, 4)
        se (r == 1) { cla = "Kamo" dominio = "Rito de Sangue" } 
        senao se (r == 2) { cla = "Inumaki" dominio = "Eco do Silencio" } 
        senao se (r == 3) { cla = "Geto" dominio = "Inferno das Mil Maldicoes" }
        senao { cla = "Awasaka" dominio = "Mundo Invertido" }
      }

      escreva("Tentativa: ", 4 - tent, "/3 | RESULTADO: Cla ", cla, " (", raridade, ")\n")
      se (tent > 1) { escreva("Aceitar? (s/n): ") leia(conf) se (conf == "s") { tent = 0 } senao { tent = tent - 1 } } 
      senao { u.aguarde(1000) tent = 0 }
    }

    // --- GACHA DE TÉCNICA ---
    tent = 3
    enquanto (tent > 0) {
      limpa()
      sorteio_tec = u.sorteia(1, 100)
      se (cla == "Gojo") { se (sorteio_tec <= 40) { tecnica = "Ilimitado + Seis Olhos" } senao { tecnica = "Lapsus de Azul" } }
      senao se (cla == "Fushiguro (Restricao)") { tecnica = "Corpo de Aco" tent = 1 }
      senao se (cla == "Itadori") { se (sorteio_tec <= 30) { tecnica = "Punho Divergente + Sukuna" } senao { tecnica = "Punho Divergente" } }
      senao se (cla == "Okkotsu") { se (sorteio_tec <= 50) { tecnica = "Copia + Rika" } senao { tecnica = "Saida de Energia" } }
      senao se (cla == "Inumaki") { tecnica = "Fala Amaldicoada" }
      senao se (cla == "Nanami") { tecnica = "Razao 7:3" }
      senao { tecnica = "Energia Amaldicoada Bruta" }

      escreva("TECNICA: ", tecnica, "\n")
      se (tent > 1 e cla != "Fushiguro (Restricao)") { escreva("Aceitar? (s/n): ") leia(conf) se (conf == "s") { tent = 0 } senao { tent = tent - 1 } } 
      senao { u.aguarde(1000) tent = 0 }
    }

    // --- STATUS BASE ---
    se (cla == "Gojo") { hp_max=650 en_max=850 atk=75 con=150 res=80 } 
    senao se (cla == "Itadori") { hp_max=700 en_max=350 atk=140 con=1200 res=110 }
    senao se (cla == "Fushiguro (Restricao)") { hp_max=1800 en_max=0 atk=450 con=0 res=350 } 
    senao { hp_max=450 en_max=450 atk=85 con=85 res=80 }
    
    // --- SISTEMA DE PASSIVAS ÚNICAS ---
    se (cla == "Gojo") { passiva_nome = "Infinito" passiva_desc = "Consumo de EN reduzido pela metade." }
    senao se (cla == "Fushiguro (Restricao)") { passiva_nome = "Zero Energia" passiva_desc = "Imune a efeitos de drenagem e +20% Res." res += (res * 0.2) }
    senao se (cla == "Sugawara (Ancestral)") { passiva_nome = "Sabedoria Heian" passiva_desc = "+50% ganho de EXP." }
    senao se (cla == "Okkotsu") { passiva_nome = "Copia Imparável" passiva_desc = "+1000 Energia Max." en_max += 1000 }
    senao se (cla == "Itadori") { passiva_nome = "Vaso Perfeito" passiva_desc = "+200 HP Max." hp_max += 200 }
    senao se (cla == "Zenin") { passiva_nome = "Orgulho do Clã" passiva_desc = "+30 ATK Base." atk += 30 }
    senao se (cla == "Kamo") { passiva_nome = "Manipulacao Sanguinea" passiva_desc = "Cura passiva ao atacar." }
    senao se (cla == "Inumaki") { passiva_nome = "Selo da Fala" passiva_desc = "+50 Controle Base." con += 50 }
    senao { passiva_nome = "Vontade de Ferro" passiva_desc = "+10% em todos os status." atk += 10 res += 10 con += 10 }

    hp = hp_max en = en_max

    // --- LOOP PRINCIPAL ---
    enquanto (hp > 0 e cap <= 40) { 
      // --- SISTEMA DE LEVEL E RANK ---
      se (exp >= (lvl * 1000)) {
        lvl = lvl + 1
        exp = 0
        hp_max = hp_max + 100
        en_max = en_max + 100
        atk = atk + 20
        res = res + 20
        con = con + 20
        escreva("\n⭐ SUBIU DE NÍVEL! Nível atual: ", lvl, "\n")
        u.aguarde(1500)
      }

      se (lvl >= 8 ou cap >= 10) { rank = "Grau Especial 🔴" }
      senao se (lvl >= 6 ou cap >= 5) { rank = "1º Grau 🟠" }
      senao se (lvl >= 4 ou cap >= 3) { rank = "2º Grau 🟡" }
      senao se (lvl >= 2) { rank = "3º Grau 🟢" }

      limpa()
      escreva("=== [", rank, "] ", nome, " (Lvl ", lvl, ") | IENES: ", ienes, " ===\n")
      escreva("TÉCNICA: ", tecnica, " | CLÃ: ", cla, "\n")
      escreva("PASSIVA: [", passiva_nome, "] - ", passiva_desc, "\n")
      escreva("HP: ", hp, "/", hp_max, " | ENERGIA: ", en, "/", en_max, "\n")
      escreva("ATK: ", atk, " | CON: ", con, " | RES: ", res, "\n")
      escreva("EXP: ", exp, "/", (lvl * 1000), "\n")
      escreva("--------------------------------------------------\n")
      escreva("1. AVANCAR HISTORIA (Cap. ", cap, ")\n")
      escreva("2. LOJA DE FERRAMENTAS\n")
      escreva("3. VOTO VINCULATIVO (Contratos Únicos)\n")
      escreva("4. BESTIARIO (Informacoes)\n")
      escreva("5. DESCANSAR (Cura Total - 100 Ienes)\n")
      escreva("6. EXPANSÃO DE DOMÍNIO (Info)\n")
      escreva("Escolha: ")
      
      inteiro menu
      leia(menu)

      se (menu == 1) {
        limpa()
        se (cap >= 1 e cap <= 2) { escreva("📜 Cap 1-2: Maldições de Nível Baixo - Grau 4 estão surgindo!\n") }
        senao se (cap >= 3 e cap <= 4) { escreva("📜 Cap 3-4: A situação piora. Maldições de Nível Grau 3 detectadas!\n") }
        senao se (cap >= 5 e cap <= 9) { escreva("📜 Cap 5-9: O perigo é real. Você enfrenta o poder do Grau 1!\n") }
        senao se (cap == 10) { escreva("📜 Cap 10: O medo se manifesta. Grau Especial no caminho!\n") }
        senao se (cap == 12) { escreva("📜 Cap 12: O vulcão desperta. Jogo está diante de você!\n") }
        senao se (cap == 15) { escreva("📜 Cap 15: A alma é volúvel. Mahito quer transfigurar seu destino!\n") }
        senao se (cap == 18) { escreva("📜 Cap 18: A natureza clama por vingança. Hanami bloqueia o caminho!\n") }
        senao se (cap == 20) { escreva("📜 Cap 20: O oceano de sangue. Dagon expande seu território!\n") }
        senao se (cap == 25) { escreva("📜 Cap 25: O Rei das Maldições desperta. Sukuna te encara!\n") }
        senao se (cap == 30) { escreva("📜 Cap 30: O AUGE DO TERROR. Sukuna Era Heian revela sua forma real!\n") }
        senao { escreva("📜 AVANÇANDO: Você continua sua jornada exorcisando o mal que cruza seu caminho.\n") }
        u.aguarde(2000)

        inteiro hp_i = 550 * cap, atk_i = 60 + (cap * 30)
        dominio_ativo = falso
        dominio_inimigo_ativo = falso
        
        enquanto (hp > 0 e hp_i > 0) {
          limpa()
          escreva("👹 INIMIGO: ", hp_i, " | ❤️ VOCÊ: ", hp, " | ✨ EN: ", en, "/", en_max, "\n")
          se (dominio_ativo) { escreva("✨ SEU DOMÍNIO ATIVO: ", dominio, " ✨\n") }
          se (dominio_inimigo_ativo) { escreva("💀 DOMÍNIO INIMIGO ATIVO! 💀\n") }
          
          escreva("1. ATAQUE | 2. ", tecnica, " (90 EN)\n")
          escreva("3. EXPANDIR DOMÍNIO (250 EN) | 4. ENERGIA REVERSA (120 EN)\n")
          inteiro ac
          leia(ac)
          
          inteiro d = 0
          se (ac == 1) { 
            d = atk 
            se (cla == "Kamo") { hp += 20 se (hp > hp_max) hp = hp_max }
          }
          senao se (ac == 2 e (en >= 90 ou en_max == 0)) { 
            inteiro custo = 90
            se (cla == "Gojo") { custo = 45 }
            en = en - custo 
            d = (atk + con) * 2 
          }
          senao se (ac == 3 e en >= 250 e nao dominio_ativo e cla != "Fushiguro (Restricao)") {
            en = en - 250
            se (dominio_inimigo_ativo ou cap >= 2) {
              escreva("⚔️ CLASH DE EXPANSÃO! ⚔️\n")
              u.aguarde(2000)
              se (u.sorteia(1, 2) == 1) { 
                dominio_ativo = verdadeiro 
                dominio_inimigo_ativo = falso
                escreva("VOCÊ SOBREPUJOU O DOMÍNIO!\n") 
              } 
              senao { 
                hp = hp - (hp_max*0.2) 
                escreva("SEU DOMÍNIO FOI QUEBRADO!\n") 
              }
            } senao { dominio_ativo = verdadeiro }
          }
          senao se (ac == 4 e en >= 120 e en_max > 0) {
            en = en - 120
            hp = hp + (hp_max * 0.3)
            se (hp > hp_max) { hp = hp_max }
          }
          
          // --- LÓGICA DE EXPANSÃO DO INIMIGO ---
          se (nao dominio_inimigo_ativo e nao dominio_ativo) {
             se (cap == 15 ou cap == 20 ou cap == 25 ou cap == 30 ou cap == 35 ou cap == 40) {
                se (u.sorteia(1, 100) <= 15) {
                   escreva("\n⚠️ O INIMIGO ESTÁ EXPANDINDO O DOMÍNIO! ⚠️\n")
                   u.aguarde(1900)
                   dominio_inimigo_ativo = verdadeiro
                }
             }
          }

          // --- EFEITOS ÚNICOS DE CADA DOMÍNIO (SISTEMA DE ANIME) ---
          se (dominio_ativo) { 
            se (dominio == "Vazio Imensuravel") {
                escreva("♾️ EFEITO: Oponente paralisado por excesso de informação!\n")
                d = d * 3 // Dano massivo
                atk_i = atk_i / 2 // Inimigo ataca fraco
            }
            senao se (dominio == "Santuario Malevolente") {
                escreva("⛩️ EFEITO: Cortes automáticos (Cleave & Dismantle)!\n")
                hp_i = hp_i - (atk * 2) // Dano fixo extra por turno
                d = d + (d / 2)
            }
            senao se (dominio == "Amor Autentico Mutuo") {
                escreva("💍 EFEITO: Rika copia a fraqueza do inimigo!\n")
                d = d * 2
                res = res + 100 // Proteção total
            }
            senao se (dominio == "Jardim das Sombras Quimericas") {
                escreva("🐺 EFEITO: Ataques de todos os ângulos!\n")
                d = d * 2.5
            }
            senao se (dominio == "Horizonte de Sangue") {
                escreva("🩸 EFEITO: O sangue ferve e te cura!\n")
                hp = hp + (hp_max * 0.1)
                d = d + (d / 2)
            }
            senao { 
                d = d + (d / 2) // Bônus padrão para domínios comuns
            }
          } 

          se (d > 0 e u.sorteia(1, 100) <= 20) { d = d * 2 escreva("⚡ BLACK FLASH!\n") }
          
          hp_i = hp_i - d
          se (hp_i > 0) { 
            inteiro dano_inimigo = atk_i - (res/4)
            se (dominio_ativo) { dano_inimigo = dano_inimigo / 2 } 
            se (dominio_inimigo_ativo) { dano_inimigo = dano_inimigo * 2 escreva("💀 O Domínio inimigo aumenta o dano recebido!\n") }
            hp = hp - dano_inimigo 
          }
          u.aguarde(700)
        }
        se (hp > 0) { 
          cap = cap + 1 
          ienes = ienes + 500 
          inteiro exp_ganha = (500 * cap)
          se (cla == "Sugawara (Ancestral)") { exp_ganha = exp_ganha * 1.5 } 
          exp = exp + exp_ganha
          escreva("\nVITÓRIA! Você ganhou EXP e Ienes.")
          u.aguarde(1500)
        }
      }
      
      senao se (menu == 2) { // LOJA
        limpa()
        escreva("--- 🛒 LOJA DE FERRAMENTAS AMALDIÇOADAS ---\n")
        escreva("1. Nuibari (Agulha): +50 ATK [500 Ienes]\n")
        escreva("2. Armadura de Couro: +50 RES [500 Ienes]\n")
        escreva("3. Amuleto de Energia: +100 EN_MAX [700 Ienes]\n")
        escreva("4. Voltar\n")
        escreva("Seus Ienes: ", ienes, "\nEscolha: ")
        inteiro loja
        leia(loja)
        se (loja == 1 e ienes >= 500) { atk += 50 ienes -= 500 escreva("Item equipado!") }
        se (loja == 2 e ienes >= 500) { res += 50 ienes -= 500 escreva("Item equipado!") }
        se (loja == 3 e ienes >= 700) { en_max += 100 ienes -= 700 escreva("Item equipado!") }
        u.aguarde(1000)
      }

      senao se (menu == 3) { // VOTO VINCULATIVO
        limpa()
        escreva("--- 🤝 VOTOS VINCULATIVOS (Contratos de Alma) ---\n")
        escreva("Cada voto só pode ser feito uma vez!\n\n")
        
        se (nao v1) escreva("1. Revelar as Cartas: -50 HP Max por +120 ATK\n") senao escreva("1. [FEITO]\n")
        se (nao v2) escreva("2. Sobrevivencia: -60 ATK por +200 HP Max\n") senao escreva("2. [FEITO]\n")
        se (nao v3) escreva("3. Foco Absoluto: -100 EN Max por +100 RES\n") senao escreva("3. [FEITO]\n")
        se (nao v4) escreva("4. Juramento de Sangue: -150 HP Max por +150 RES\n") senao escreva("4. [FEITO]\n")
        se (nao v5) escreva("5. Sobrecarga: -50 RES por +200 EN Max\n") senao escreva("5. [FEITO]\n")
        se (nao v6) escreva("6. Pacto de Heian: -200 Ienes por +70 CON e +70 RES\n") senao escreva("6. [FEITO]\n")
        se (nao v7) escreva("7. Voto de Pobreza: Perde todo Ienes por +250 HP Max\n") senao escreva("7. [FEITO]\n")
        se (nao v8) escreva("8. Restricao Parcial: -300 EN Max por +250 ATK\n") senao escreva("8. [FEITO]\n")
        
        escreva("\n0. Voltar\nEscolha: ")
        inteiro ev
        leia(ev)

        se (ev == 1 e nao v1 e hp_max > 100) { hp_max -= 50 atk += 120 v1 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 2 e nao v2 e atk > 100) { atk -= 60 hp_max += 200 v2 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 3 e nao v3 e en_max > 200) { en_max -= 100 res += 100 v3 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 4 e nao v4 e hp_max > 300) { hp_max -= 150 res += 150 v4 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 5 e nao v5 e res > 60) { res -= 50 en_max += 200 v5 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 6 e nao v6 e ienes >= 200) { ienes -= 200 con += 70 res += 70 v6 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 7 e nao v7 e ienes > 0) { ienes = 0 hp_max += 250 v7 = verdadeiro escreva("Voto selado!") }
        senao se (ev == 8 e nao v8 e en_max > 400) { en_max -= 300 atk += 250 v8 = verdadeiro escreva("Voto selado!") }
        senao se (ev != 0) { escreva("Invalido ou ja realizado!") }
        u.aguarde(1500)
      }

      senao se (menu == 4) { // BESTIARIO
        limpa()
        escreva("--- 📖 BESTIÁRIO ---\n")
        escreva("Cap 1-2: Maldições de Nível Baixo - Grau 4\n")
        escreva("Cap 3-4: Maldições de Nível Grau 3\n")
        escreva("Cap 5-9: Graus 1\n")
        escreva("Cap 10: Grau especial\n")
        escreva("Cap 12: Jogo - Maldição Vulcão 🌋\n")
        escreva("Cap 15: Marhito - Maldição da Alma 🤚🏻 \n")
        escreva("Cap 18: Hanami - Maldição das Plantas 🌿\n")
        escreva("Cap 20: Dagon - Maldição do Oceano 🌊 \n")
        escreva("Cap 25: Sukuna - Rei das Maldições 👑\n")
        escreva("Cap 30: Sukuna Era Hean 👑\n")
        escreva("\nQualquer tecla para voltar...")
        leia(tecla)
      }

      senao se (menu == 5) { // DESCANSAR
        se (ienes >= 100) { ienes -= 100 hp = hp_max en = en_max escreva("Curado!") } 
        senao { escreva("Ienes insuficientes!") }
        u.aguarde(1000)
      }

      senao se (menu == 6) { // STATUS DO DOMÍNIO
        limpa()
        escreva("--- DETALHES DA EXPANSÃO ---\n")
        se (dominio == "Vazio Imensuravel") escreva("Efeito: Dano 3x e reduz dano inimigo drasticamente.\n")
        senao se (dominio == "Santuario Malevolente") escreva("Efeito: Dano contínuo automático e bônus de 50% ATK.\n")
        senao se (dominio == "Amor Autentico Mutuo") escreva("Efeito: Dano 2x e Resistência Máxima.\n")
        senao se (dominio == "Jardim das Sombras Quimericas") escreva("Efeito: Multiplica o dano total em 2.5x.\n")
        senao se (dominio == "Horizonte de Sangue") escreva("Efeito: Aumenta dano e cura 10% de HP por turno.\n")
        senao escreva("Efeito: +50% de Dano e -50% de Dano Recebido.\n")
        escreva("\nQualquer tecla para voltar...")
        leia(tecla)
      }
      
      en = en + 60
      se (en > en_max) { en = en_max }
    }
    
    // ... (restante do código final de vitória/derrota igual)
    limpa()
    se (hp <= 0) { 
        escreva("--- 💀 FINAL: A QUEDA DO FEITICEIRO 💀 ---\n")
        escreva("Seu corpo não aguentou o fardo do destino.\n")
        escreva("Enquanto você cai, as maldições riem sobre seus ossos.\n")
        escreva("O nome ", nome, " foi esquecido pelas areias do tempo.\n")
        escreva("\nVOCÊ FOI EXORCIZADO... FIM DE JOGO.") 
    }
    senao { 
        escreva("--- 🏆 FINAL: O APICE DA ERA HEIAN 🏆 ---\n")
        escreva("Com um golpe final, o horizonte de Kyoto se curva perante você.\n")
        escreva("Não restam mais oponentes. Não restam mais deuses.\n")
        escreva("Usando o ", dominio, ", você moldou a realidade à sua imagem.\n")
        escreva("O Clã ", cla, " agora governa a eternidade através de você.\n")
        escreva("\nVOCÊ É O MAIS FORTE!🤞🏻♾️🤞🏻⚫️-⚫️ !") 
    }
  }
}