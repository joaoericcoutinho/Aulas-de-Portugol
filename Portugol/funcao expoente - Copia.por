programa {
  funcao inicio() {
   
    real n1, n2
    real resultado


    escreva("Digite o primeiro numeros base: \n")
    leia(n1)
    escreva("Digite o segundo numero expoente: \n")
    leia(n2)
    

    resultado = potencia(n1, n2)

    escreva("\nO resultado é: ", resultado)

  }

  
  funcao real potencia (real base, real expoente){
    real resultado = 1
    inteiro i
   
   para(i = 1; i <= expoente; i++){
      resultado = resultado * base
    }

    retorne resultado
  }

}
