programa {
  funcao inicio() {

    real n1
    inteiro opcao
    logico controlador = verdadeiro

    escreva("----- Seja bem vindo -----\n")

    enquanto(controlador){

      escreva("\nEscolha uma opção:\n")
      escreva("1 - Verificar se o número é positivo ou negativo\n")
      escreva("2 - Verificar se o número é par ou ímpar\n")
      escreva("0 - Sair\n")
      leia(opcao)

      se(opcao == 1){

        escreva("\nDigite um número: ")
        leia(n1)

        se(n1 > 0){
          escreva("O número ", n1, " é positivo\n")
        }
        senao se(n1 < 0){
          escreva("O número ", n1, " é negativo\n")
        }
        senao{
          escreva("O número é zero\n")
        }

      }
      senao se(opcao == 2){

        escreva("\nDigite um número: ")
        leia(n1)

        se(n1 % 2 == 0){
          escreva("O número ", n1, " é par\n")
        }
        senao{
          escreva("O número ", n1, " é ímpar\n")
        }

      }
      senao se(opcao == 0){
        escreva("Encerrando o programa...\n")
        controlador = falso
      }
      senao{
        escreva("🛑 Opção inválida!\n")
        pare
      }

    }

  }
}
