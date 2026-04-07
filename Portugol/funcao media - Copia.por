programa {
  funcao inicio() {
   
    real n1, n2, n3
    real resultado


    escreva("Digite o primeiro nota: \n")
    leia(n1)
    escreva("Digite o segundo nota: \n")
    leia(n2)
    escreva("Digite o terceira nota: \n")
    leia(n3)

    resultado = media(n1, n2, n3)

    escreva("\nA média é: ", resultado)

  }

  
  funcao real media (real n1, real n2, real n3){
    real x
   x = (n1 + n2 + n3) / 3
    retorne x
  }

}
