programa {
  funcao inicio() {

    inteiro x, y, aux

    escreva("Digite x: ")
    leia(x)

    escreva("Digite y: ")
    leia(y)

    // troca
    aux <- x
    x <- y
    y <- aux

    escreva("Depois da troca:\n")
    escreva("x = ", y, "\n")
    escreva("y = ", x)
  }
}
