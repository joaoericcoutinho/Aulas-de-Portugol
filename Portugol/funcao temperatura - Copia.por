programa {
  funcao inicio() {

    real celsius
    real resultado

    escreva("\nDigite a temperatura em Celsius: ")
    leia (celsius)
    
    
    resultado = temperatura(celsius)
    resultadocalor(resultado)
  }



  funcao real temperatura(real celsius){
    real calor = (celsius * 9/5)+32
    retorne calor




  }

  funcao vazio resultadocalor (real resultado){
    escreva("A temperatura em Fahrenheit é: ", resultado)
  }

}
