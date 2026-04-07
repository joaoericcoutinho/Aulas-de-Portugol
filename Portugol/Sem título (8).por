programa {
  funcao inicio() {

    msg(" Eric")
    escreva(soma(20 ,10))
    escreva("\n", soma(20,10))

    inteiro b = 20
    inteiro a = 10
    inteiro resultado = soma(a,b)

    escreva("\n", resultado)
    
  }

  // funcao sem retorno
  // Apenas executa ação
  // pode ou nao receber parametros
  funcao vazio msg(cadeia nome){
    escreva("\nHello word", nome)
  }

  // Função com retorno
  // Retorna valores
  // Recebe parametros
  funcao inteiro soma(inteiro a, inteiro b){
    inteiro c = a + b
    retorne c
  }

}
