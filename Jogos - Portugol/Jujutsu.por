programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// --- STATUS E VARIÁVEIS ---
		cadeia nome = "", cla = "", tecnica = "", dominio = "", raridade = "", rank = "4º Grau"
		inteiro hp_max = 0, hp = 0, en_max = 0, en = 0
		inteiro atk = 0, con = 0, res = 0
		inteiro cap = 1, ienes = 200, exp = 0
		
		// --- VARIÁVEIS DE SISTEMA ---
		inteiro tent = 3, sorteio_raridade = 0, sorteio_tec = 0
		cadeia conf = "", tecla = ""
		logico dominio_ativo = falso

		escreva("--- 🏯 JUJUTSU KAISEN: RITUAL DE SANGUE 🏯 ---\n")
		escreva("Digite seu nome: ")
		leia(nome)

		// --- GACHA DE CLÃ ---
		enquanto (tent > 0) {
			limpa()
			sorteio_raridade = u.sorteia(1, 100) 
			se (sorteio_raridade <= 5) { 
				raridade = "LENDÁRIO 🟡"
				inteiro r = u.sorteia(1, 3)
				se (r == 1) { cla = "Gojo" dominio = "Vazio Imensuravel" } 
				senao se (r == 2) { cla = "Fushiguro (Restricao)" dominio = "Nenhum (Restricao)" }
				senao { cla = "Sugawara (Ancestral)" dominio = "Templo do Crepusculo" }
			}
			senao se (sorteio_raridade <= 20) { 
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

		// --- STATUS ---
		se (cla == "Gojo") { hp_max=450 en_max=850 atk=75 con=130 res=65 } 
		senao se (cla == "Itadori") { hp_max=700 en_max=350 atk=140 con=50 res=110 }
		senao se (cla == "Fushiguro (Restricao)") { hp_max=1800 en_max=0 atk=450 con=0 res=350 } 
		senao { hp_max=450 en_max=450 atk=85 con=85 res=80 }
		hp = hp_max en = en_max

		// --- LOOP PRINCIPAL ---
		enquanto (hp > 0 e cap <= 5) {
			limpa()
			escreva("=== [", rank, "] ", nome, " | IENES: ", ienes, " ===\n")
			escreva("TÉCNICA: ", tecnica, " | CLÃ: ", cla, " (", raridade, ")\n")
			escreva("HP: ", hp, "/", hp_max, " | ENERGIA: ", en, "/", en_max, "\n")
			escreva("ATK: ", atk, " | CON: ", con, " | RES: ", res, "\n")
			escreva("--------------------------------------------------\n")
			escreva("1. AVANCAR HISTORIA (Cap. ", cap, ")\n")
			escreva("2. LOJA DE FERRAMENTAS\n")
			escreva("3. VOTO VINCULATIVO (Contrato de Alma)\n")
			escreva("4. BESTIARIO (Informacoes)\n")
			escreva("5. DESCANSAR (Cura Total - 100 Ienes)\n")
			escreva("6. EXPANSÃO DE DOMÍNIO (Status do Dominio)\n")
			escreva("Escolha: ")
			
			inteiro menu
			leia(menu)

			se (menu == 1) {
				inteiro hp_i = 550 * cap, atk_i = 60 + (cap * 30)
				dominio_ativo = falso
				
				enquanto (hp > 0 e hp_i > 0) {
					limpa()
					escreva("👹 INIMIGO: ", hp_i, " | ❤️ VOCÊ: ", hp, " | ✨ EN: ", en, "/", en_max, "\n")
					se (dominio_ativo) { escreva("✨ DOMÍNIO ATIVO: ", dominio, " (+50% DANO) ✨\n") }
					escreva("1. ATAQUE | 2. ", tecnica, " (90 EN)\n")
					escreva("3. EXPANDIR DOMÍNIO (250 EN) | 4. ENERGIA REVERSA (120 EN)\n")
					inteiro ac
					leia(ac)
					
					inteiro d = 0
					se (ac == 1) { d = atk }
					senao se (ac == 2 e (en >= 90 ou en_max == 0)) { en = en - 90 d = (atk + con) * 2 }
					senao se (ac == 3 e en >= 250 e nao dominio_ativo e cla != "Fushiguro (Restricao)") {
						en = en - 250
						
						// --- CLASH DE EXPANSÃO (SÓ COM BOSSES) ---
						se (cap >= 2) {
							limpa()
							escreva("⚠️ O BOSS TAMBÉM ESTÁ EXPANDINDO O DOMÍNIO! ⚠️\n")
							escreva("⚔️ CLASH DE EXPANSÃO: DISPUTA DE PODER! ⚔️\n")
							u.aguarde(1500)
							
							inteiro sorte = u.sorteia(1, 2) // 50% de chance para cada lado
							se (sorte == 1) {
								escreva("✅ VOCÊ VENCEU O CLASH! O domínio do boss foi quebrado!\n")
								dominio_ativo = verdadeiro
								hp_i = hp_i - (atk * 3) // Dano bônus por vencer o clash
							} senao {
								escreva("❌ VOCÊ PERDEU O CLASH! O domínio do boss prevaleceu!\n")
								hp = hp - (hp_max * 0.25) // Perde 25% da vida no choque
								en = en / 2 // Perde metade da energia restante
							}
						} senao {
							dominio_ativo = verdadeiro
							escreva("🔥 RYOIKI TENKAI: ", dominio, "! 🔥\n")
						}
						u.aguarde(1500)
					}
					senao se (ac == 4 e en >= 120 e cla != "Fushiguro (Restricao)") {
						en = en - 120
						inteiro cura = hp_max * 0.3
						hp = hp + cura
						se (hp > hp_max) { hp = hp_max }
						escreva("✨ ENERGIA REVERSA: +", cura, " HP! ✨\n")
						u.aguarde(1000)
					}
					
					se (dominio_ativo) { d = d + (d / 2) } 
					se (d > 0 e u.sorteia(1, 100) <= 20) { d = d * 2 escreva("⚡ BLACK FLASH!\n") }
					
					hp_i = hp_i - d
					se (hp_i > 0) { 
						inteiro dano_inimigo = atk_i - (res/4)
						se (dominio_ativo) { dano_inimigo = dano_inimigo / 2 } 
						hp = hp - dano_inimigo 
					}
					u.aguarde(800)
				}
				se (hp > 0) { cap = cap + 1 ienes = ienes + 500 exp = exp + 100 }
			}
			senao se (menu == 6) {
				limpa()
				escreva("--- INFORMAÇÕES DO SEU DOMÍNIO ---\n")
				escreva("NOME: ", dominio, "\n")
				escreva("CUSTO: 250 Energia\n")
				escreva("CLASH: Contra bosses, há 50% de chance de vencer ou ser repelido.\n")
				se (cla == "Fushiguro (Restricao)") { escreva("AVISO: Voce possui Restricao Celestial. Nao pode expandir dominios.\n") }
				escreva("\nDigite algo para voltar: ")
				leia(tecla)
			}
			senao se (menu == 5) { se (ienes >= 100) { ienes = ienes - 100 hp = hp_max en = en_max } }
			
			en = en + 60
			se (en > en_max) { en = en_max }
		}
	}
}