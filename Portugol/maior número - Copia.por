programa {
  funcao inicio() {

    inteiro numeros[10]
    inteiro i
    inteiro maior


    para(i = 0; i < 10; i++){
      escreva("Digite o ", i+1, "º número: ")
      leia(numeros[i])

      maior = numeros[0]
    }

    para(i = 1; i < 10; i++){
      se(numeros[i] > maior){
        maior = numeros[i]
      }
    }
      escreva("\nO maior número é: ", maior)
  }
}
