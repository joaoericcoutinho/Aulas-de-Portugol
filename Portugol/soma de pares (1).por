programa {
  funcao inicio() {

    inteiro numeros[8]

    numeros[0] = 10
    numeros[1] = 22
    numeros[2] = 33
    numeros[3] = 44
    numeros[4] = 55
    numeros[5] = 66
    numeros[6] = 77
    numeros[7] = 88

    inteiro pares = 0
    inteiro soma = 0

    escreva("Os números pares são:\n")

    para(inteiro i = 0; i < 8; i++){   
      
      se(numeros[i] % 2 == 0){
        escreva(numeros[i], "\n")
        pares++
        soma = numeros[6] + numeros[4] + numeros[2]
      }

    }

    escreva("Total de números pares: ", pares, "\n")
    escreva("Soma dos números da posições pares: ", soma)

  }
}
