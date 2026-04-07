programa {
  funcao inicio() {

    inteiro numeros[15]

    numeros[0] = 10
    numeros[1] = 22
    numeros[2] = 33
    numeros[3] = 44
    numeros[4] = 55
    numeros[5] = 66
    numeros[6] = 77
    numeros[7] = 88
    numeros[8] = 99
    numeros[9] = 11
    numeros[10] = 15
    numeros[11] = 25
    numeros[12] = 37
    numeros[13] = 49
    numeros[14] = 80

    inteiro pares = 0

    escreva("Os números pares são:\n")

    para(inteiro i = 0; i < 15; i++){
      
      se(numeros[i] % 2 == 0){
        escreva(numeros[i], "\n")
        pares++
      }

    }

    escreva("Total de números pares: ", pares)

  }
}
