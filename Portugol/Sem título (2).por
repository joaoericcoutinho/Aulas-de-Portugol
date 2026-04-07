programa {
  funcao inicio() {

    real n1, n2, n3


    escreva("Digite o valor do primeiro produto: ")
    leia(n1)
    escreva("Digite o valor do segundo produto: ")
    leia(n2)
    escreva("Digite o valor do terceiro produto: ")
    leia(n3)

    real soma = n1+n2+n3
    real desconto = 0.15
    real valorTotal =soma - (soma*desconto)


    se(soma > 200){
    escreva("Desconto concedido")
    valorTotal = soma - (soma*desconto)
    escreva("Seu desconto foi de:", (soma*desconto), "\n")
    escreva("Sua compra de R$ ", valorTotal)

  }senao{
    escreva("Desconto indisponivel")
  }





    
  
     

  



  


  }
}
