programa {
  funcao inicio() {

    inteiro numeros[10]
    inteiro i
    inteiro menor, posicao


    para(i = 0; i < 10; i++){
      escreva("Digite o ", i+1, "º número: ")
      leia(numeros[i])

      menor = numeros[0]
    }

    para(i = 1; i < 10; i++){
      se(numeros[i] < menor){
        menor = numeros[i]
        posicao = i
       
      }
    }
      escreva("\nO menor número é: ", menor, " e a posição dele é ", posicao)
  }
}
