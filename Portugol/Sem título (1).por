programa {
  funcao inicio() {

    real nota1
    real nota2
    real nota3
    real nota4


    escreva("Digite sua 1 nota:")
      leia(nota1)
    escreva("Digite sua 2 nota:")
    leia(nota2)
    escreva("Digite sua 3 nota:")
    leia(nota3)
    escreva("Digite sua 4 nota:")
    leia(nota4)
    real media = (nota1+nota2+nota3+nota4) / 4

  

   se( media >= 7)
      escreva("Aprovado, sua média foi " + media)
   senao se (media < 4 )
      escreva("Reprovado, sua média foi " + media)
      senao se (media >= 4 e media < 7)
      escreva("Recuperção, sua média foi " + media)
  
      

  }
}
