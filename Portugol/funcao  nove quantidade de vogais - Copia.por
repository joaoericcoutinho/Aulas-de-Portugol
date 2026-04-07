programa {

  inclua biblioteca Texto --> txt

  funcao inicio() {

    cadeia palavra
    
    escreva("Digite uma palavra: ")
    leia(palavra)

    escreva("A sua palavra tem ", vogais(palavra), " vogais")
  }

  funcao inteiro vogais(cadeia palavra){

    inteiro qtd = 0
    inteiro tamanho = txt.numero_caracteres(palavra)
    caracter letras[tamanho]

    para(inteiro i = 0; i < tamanho; i++){
      letras[i] = txt.obter_caracter(palavra, i)
    }

    para(inteiro i = 0; i < tamanho; i++){
      se(letras[i] == 'a' ou letras[i] == 'e' ou letras[i] == 'i' ou letras[i] == 'o' ou letras[i] == 'u' ou
         letras[i] == 'A' ou letras[i] == 'E' ou letras[i] == 'I' ou letras[i] == 'O' ou letras[i] == 'U'){
        qtd++
      }
    }

    retorne qtd
  }
}
