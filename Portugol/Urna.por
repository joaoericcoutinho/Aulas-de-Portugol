programa {
  funcao inicio() {

    cadeia nome1, nome2, nome3
    inteiro numero
    inteiro voto = 0
    inteiro opcao,senha
    logico controlador = verdadeiro

    enquanto (verdadeiro) {
      escreva("Digite a senha, dica o número do amigo: ")
      leia(senha)

      se (senha == 24) {
        escreva("Acesso permitido!\n")
        pare
      }
      senao {
        escreva("Senha inválida! Tente novamente.\n\n")
      }
    }
    
    
    escreva("----- Bem vindo a Urna eletrônica! -----\n")

    enquanto(controlador){

      escreva("\nEscolha uma opção do menu:\n")
      escreva("1 - Cadastro do Eleitor\n")
      escreva("2 - Voto \n")
      escreva("3 - Sair\n")

      leia(opcao)

      escolha(opcao){

        caso 1:
          escreva("\n Faça o seu cadastro, digite seu nome: ", "\n")
          leia(nome1)
          escreva("Digite seu numero: ")
          leia(numero)
          pare


          caso 2:
          escreva("\n Em quem você vai votar: ")
          escreva(nome1,"\n", nome2, "\n", nome3)
          leia(voto)
          voto = i
          pare


        caso 3:
          escreva("Encerrando o programa...\n")
          controlador = falso
          pare

        caso contrario:
          escreva("Opção inválida!\n")
          pare

      }
    }
  }
}
