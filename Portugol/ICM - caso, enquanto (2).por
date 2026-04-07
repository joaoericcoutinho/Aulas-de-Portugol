programa {
  funcao inicio() {
    // para - for
    // faca - do
    // enquanto - while

//while
    real altura, peso, imc
    logico controlador = verdadeiro
    cadeia resposta

    escreva (" ----- Seja bem vindo a calculadora IMC! -----\n")


    enquanto(controlador){
      escreva("\n Deseja calcular seu IMC? Sim ou Não\n")
      leia(resposta)
      escolha(resposta){
        caso "Sim":
      escreva ("Por favor, para começar, digite a sua altura em metros: ")
      leia(altura)
      escreva("\n")
      escreva (" Por favor, para continuar, digite o seu peso em Kg: ")
      leia(peso)
      imc = peso/(altura * altura)
      escreva("\n")
      escreva("Seu IMC é: ", imc)
      escreva("\n")
      se(imc < 18.5){
        escreva("\n Você está abaixo do peso ideal! Coma mais 🍔")

        }senao se(imc > 18.5 e imc < 24.9){
          escreva("Você está no peso ideal! Parabéns 🍜")

        }senao se (imc> 25 e imc <29.9){
          escreva("Excesso de peso!")

        }senao se (imc > 30 e imc < 34.9){
          escreva("Ocesidade I! Corta o Refrigerante 🥤")

        }senao se (imc > 35 e imc<39.9 ){
          escreva("Obesidade II! Corta o churrasco 🍖")

        }senao se  (imc>40){
          escreva("Obesidade III! PARA DE COMER 🤢 ")
        }
      pare

      caso "Não":
      escreva("Obrigado! Tenha um bom dia!")
      controlador = falso
      pare

      caso contrario:
      escreva("🛑 Opição invalida, tente novamente")
      pare

      }


    }



  }





}
