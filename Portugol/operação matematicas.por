programa {
  funcao inicio() {
    inteiro opcao
    real n1, n2, resultado

    escreva("Digite uma operçao de 1 a 4:\n ")
    escreva("Soma = 1 \n")
    escreva("Subtração = 2 \n")
    escreva("Multiplicação = 3 \n")
    escreva("Divisão = 4 \n")
    leia(opcao)

    escreva("Digite o primeiro números: ")
    leia(n1)

    escreva("Digite o segundo número: ")
    leia(n2)


    escolha(opcao){
      
      caso 1:
      resultado = n1 + n2
      escreva("A soma é: ", resultado)
      pare

      caso 2:
      resultado = n1 - n2
      escreva("A subtração é: ", resultado)
      pare

      caso 3:
      resultado = n1 * n2
      escreva("A multiplicação é: ", resultado)
      pare

      caso 4:
        se (n2 != 0) {
          resultado = n1 / n2
          escreva("Resultado da divisão: ", resultado)
        } senao {
          escreva("Erro: divisão por zero!")
        }
        pare

      caso contrario:
      escreva("Operação invalidade")

    
    }



    
  }
}
