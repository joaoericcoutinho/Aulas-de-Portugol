programa {
  funcao inicio() {
   
    inteiro n1, n2, resultado
    caracter operacao

    saudacao()
    escreva("Digite o primeiro valor: \n")
    leia(n1)
    escreva("Digite o segundo valor: \n")
    leia(n2)
    escreva("Digite uma operação (+, -, *, /): \n")
    leia(operacao)

    escolha(operacao){
      caso '+':
        resultado = soma(n1,n2)
        msgResultado(resultado)
      pare

      caso '-':
        resultado = subtracao(n1,n2)
        msgResultado(resultado)
      pare

      caso '/':
        resultado = divisao(n1,n2)
        msgResultado(resultado)
      pare

      caso '*':
        resultado = multiplica(n1,n2)
        msgResultado(resultado)
      pare
    }

  }

  funcao vazio msgResultado (real a){
    escreva("\nO resultado da sua operação é: ", a)
  }
    
  funcao inteiro soma (inteiro a, inteiro b){
    retorne (a+b)
  }

  funcao inteiro subtracao (inteiro a, inteiro b){
    retorne (a-b)
  }

  funcao inteiro divisao (inteiro a, inteiro b){
    retorne (a/b)
  }

  funcao inteiro multiplica (inteiro a, inteiro b){
    retorne (a*b)
  }

  funcao vazio saudacao(){
    escreva("------------- Seja bem vindo ------------\n")
  }
}
