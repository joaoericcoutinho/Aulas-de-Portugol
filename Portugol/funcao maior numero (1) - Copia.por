programa {

  funcao inicio() {

    inteiro maior
    inteiro numeros [5]

    escreva("Digite o primeiro numero: ")
    leia(numeros [0])
    escreva("Digite o segundo numero: ")
    leia(numeros [1])
    escreva("Digite o segundo numero: ")
    leia(numeros [2])
    escreva("Digite o segundo numero: ")
    leia(numeros [3])
    escreva("Digite o segundo numero: ")
    leia(numeros [4])

    escreva("O maior numero é: ", maiorNumero(numeros))

  }

  funcao inteiro maiorNumero(inteiro numeros[]){
      inteiro maior = 0
      para(inteiro i = 0; i<5; i++){
        se(numeros[i]>maior){
            maior = numeros[i]
        }
      }
    
      retorne maior
  }

}
