programa {
  funcao inicio() {

    inteiro numero
    inteiro resultado

    escreva("\nDigite numero: ")
    leia (numero)
    
    
    resultado = fator(numero)
    resultadoFatorial(resultado)
  }

  funcao inteiro fator(inteiro numero){
    inteiro i
    inteiro fatorial = 1

    para(i = 1; i <= numero; i++){
      fatorial = fatorial * i
    }

    retorne fatorial

  }

  funcao vazio resultadoFatorial (inteiro resultado){
    escreva("O fatorial deu: ", resultado)
  }

}
