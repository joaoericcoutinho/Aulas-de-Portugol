programa {
  funcao inicio() {

    inteiro a , b
    escreva("\nDigite o valor da altura do seu retangulo: ")
    leia (a)
    escreva("\nDigite o valor da base do seu retangulo: ")
    leia (b)

    inteiro area = areRetangulo(b, a)
    resultadoArea(area)
    
    
  }



  funcao inteiro areRetangulo(inteiro base, inteiro altura){
    inteiro area = base * altura
    retorne area




  }

  funcao vazio resultadoArea (inteiro area){
    escreva("A area do seu retangulo é: ", area)
  }

}
