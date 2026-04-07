programa {
  funcao inicio() {

    cadeia nome[5]
    inteiro i
    cadeia pessoa
    logico encontrado = falso

    para(i = 0; i < 5; i++){
      escreva("Digite o ", i+1, "º nome: ")
      leia(nome[i])
    }

    escreva("\nDigite um nome para verificar se está na lista: ")
    leia(pessoa)

    para(i = 0; i < 5; i++){
      se(nome[i] == pessoa){
        encontrado = verdadeiro
      }
    }

    se(encontrado){
      escreva("O número está presente na lista.")
    }
    senao{
      escreva("O número NÃO está presente na lista.")
    }

  }
}
