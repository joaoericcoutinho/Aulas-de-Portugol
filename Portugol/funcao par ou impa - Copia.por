programa {
  funcao inicio() {

    inteiro numero

    escreva("Digite um numero: ")
    leia(numero)

    inteiro resultado = verificar(numero)

    resultadoNumero(resultado)

  }

  funcao inteiro verificar(inteiro numero){
    
    se(numero % 2 == 0){
      retorne 1
    }
    senao{
      retorne 2
    }

  }

  funcao vazio resultadoNumero(inteiro resultado){

    se(resultado == 1){
      escreva("O numero é PAR")
    }
    senao{
      escreva("O numero é IMPAR")
    }

  }

}
