programa {
  funcao inicio() {

    inteiro numeros[6]
    inteiro i
    inteiro numero
    logico encontrado = falso

    para(i = 0; i < 6; i++){
      escreva("Digite o ", i+1, "º número: ")
      leia(numeros[i])
    }

    escreva("\nDigite um número para verificar se está no vetor: ")
    leia(numero)

    para(i = 0; i < 6; i++){
      se(numeros[i] == numero){
        encontrado = verdadeiro
      }
    }

    se(encontrado){
      escreva("O número está presente no vetor.")
    }
    senao{
      escreva("O número NÃO está presente no vetor.")
    }

  }
}
