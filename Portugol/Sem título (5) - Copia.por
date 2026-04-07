programa {
  funcao inicio() {
    
    inteiro numero[5] = {10,15,96,45,12}

    inteiro numero2[2][5] = {{15,25,89,12,21},{81,34,12,96,15}}

    para(inteiro i = 0; i < 2; i++ ){
    para(inteiro j = 4; j < 5; j++){
          escreva(numero2[i][j], ", ")
      }
      escreva("\n")
    }
  }
}
