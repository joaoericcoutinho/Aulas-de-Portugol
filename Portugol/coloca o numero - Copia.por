programa {
  funcao inicio() {

    inteiro numeros[5]
    inteiro i


    para(i = 0; i < 5; i++){
      escreva("Digite um número: ")
      leia(numeros[i])
    }

    escreva("\nValores do vetor:\n")


    para(i = 0; i < 5; i++){
      escreva(numeros[i], "\n")
    }

  }
}
