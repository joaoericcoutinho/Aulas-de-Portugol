programa {

  funcao inicio() {

    inteiro numero
    logico resultado

    escreva("Digite um numero: ")
    leia(numero)

    resultado = Primo(numero)

    se(resultado){
      escreva("O numero é primo")
    }senao{
      escreva("O numero não é primo")
    }

  }

  funcao logico Primo(inteiro numero){

    inteiro i

    se(numero <= 1){
      retorne falso
    }

    para(i = 2; i < numero; i++){
      se(numero % i == 0){
        retorne falso
      }
    }

    retorne verdadeiro
  }

}
