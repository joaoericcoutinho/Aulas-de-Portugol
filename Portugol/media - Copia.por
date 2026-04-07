programa {
  funcao inicio() {

    real numeros[10]
    real soma = 0
    real media
    inteiro i


    para(i = 0; i < 10; i++){
      escreva("Digite um número real: ")
      leia(numeros[i])
      soma = soma + numeros[i]
    }

    media = soma / 10

    escreva("\nA média dos valores é: ", media)

  }
}
