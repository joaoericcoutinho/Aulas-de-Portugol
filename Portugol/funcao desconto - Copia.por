programa {

  funcao inicio() {

    real valor
    real desconto
    real resultado

    escreva("Digite o valor do produto: ")
    leia(valor)

    escreva("Digite a porcentagem de desconto: ")
    leia(desconto)

    resultado = calcularDesconto(valor, desconto)

    escreva("Valor com desconto: ", resultado)

  }

  funcao real calcularDesconto(real valor, real desconto){

    real valorFinal

    valorFinal = valor - (valor * desconto / 100)

    retorne valorFinal
  }

}
