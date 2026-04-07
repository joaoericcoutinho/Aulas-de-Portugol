programa {
  funcao inicio() {

    cadeia nome1, nome2, nome3
    inteiro num1, num2, num3

    inteiro votos1 = 0
    inteiro votos2 = 0
    inteiro votos3 = 0
    inteiro voto, opcao
    inteiro senha

    logico votacaoAtiva = falso

    escreva("----- Bem vindo a Urna eletrônica! -----\n")

    escreva("----- 📃 CADASTRO DE CANDIDATOS 📃 -----\n")

    escreva("Nome do candidato 1: ")
    leia(nome1)
    escreva("Numero do candidato 1: ")
    leia(num1)

    escreva("\nNome do candidato 2: ")
    leia(nome2)
    escreva("Numero do candidato 2: ")
    leia(num2)

    escreva("\nNome do candidato 3: ")
    leia(nome3)
    escreva("Numero do candidato 3: ")
    leia(num3)

    escreva("\n----- ZERÉSIMA -----\n")
    escreva(nome1, " (", num1, "): ", votos1, " votos\n")
    escreva(nome2, " (", num2, "): ", votos2, " votos\n")
    escreva(nome3, " (", num3, "): ", votos3, " votos\n")

    votacaoAtiva = verdadeiro

    enquanto(votacaoAtiva){

      escreva("\nDigite o número do candidato para votar\n")
      escreva("Ou digite 0 para encerrar votação\n")
      escreva("Opções:\n")
      escreva(num1, " - ", nome1, "\n")
      escreva(num2, " - ", nome2, "\n")
      escreva(num3, " - ", nome3, "\n")

      leia(voto)

      se(voto == 0){
        escreva("Digite a senha para encerrar: ")
        leia(senha)

        se(senha == 24){
          escreva("Votação encerrada!\n")
          votacaoAtiva = falso
        } senao {
          escreva("Senha incorreta! 🛑 \n")
        }
      }
      senao se(voto == num1){
        votos1++
        escreva("Voto registrado para ", nome1, "\n")
      }
      senao se(voto == num2){
        votos2++
        escreva("Voto registrado para ", nome2, "\n")
      }
      senao se(voto == num3){
        votos3++
        escreva("Voto registrado para ", nome3, "\n")
      }
      senao{
        escreva("Voto inválido!\n")
      }
    }

    escreva("\n-----RESULTADO FINAL-----\n")

    escreva(nome1, ": ", votos1, " votos\n")
    escreva(nome2, ": ", votos2, " votos\n")
    escreva(nome3, ": ", votos3, " votos\n")

  }
}
