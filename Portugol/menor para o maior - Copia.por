programa {
  funcao inicio() {

    inteiro numeros[5]
    inteiro i, j, aux

    para(i = 0; i < 5; i++){
      escreva("Digite o ", i+1, "º número: ")
      leia(numeros[i])
    }

    para(i = 0; i < 4; i++){
      para(j = i + 1; j < 5; j++){
        
        se(numeros[i] > numeros[j]){
          aux = numeros[i]
          numeros[i] = numeros[j]
          numeros[j] = aux
        }

      }
    }

    // Exibição do vetor ordenado
    escreva("\nVetor em ordem crescente:\n")
    para(i = 0; i < 5; i++){
      escreva(numeros[i], " ")
    }

  }
}

