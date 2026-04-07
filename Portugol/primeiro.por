programa {
  funcao inicio() {
    inteiro idade
    real altura

    escreva("Digite sua idade:")
    leia(idade)
    escreva("Digite sua altura:")
    leia(altura)

    se(idade <= 12 e altura <= 1.5){
      escreva("Nao pode entrar no brinquedo")
    }  senao se(idade>=12 e altura > 1.5){
      escreva("Pode entrar no brinquedo")
    } senao{
      escreva("Nao pode entrar no brinquedo")
    }

  }
}
