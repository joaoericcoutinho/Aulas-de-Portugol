programa {

  funcao inicio() {

    inteiro n1, n2
    inteiro maior

    escreva("Digite o primeiro numero: ")
    leia(n1)

    escreva("Digite o segundo numero: ")
    leia(n2)

    maior = maiorNumero(n1, n2)

    escreva("O maior numero é: ", maior)

  }

  funcao inteiro maiorNumero(inteiro n1, inteiro n2){

    se(n1 > n2){
      retorne n1
    }senao{
      retorne n2
    }

  }

}
