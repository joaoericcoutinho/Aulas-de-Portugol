programa {
  funcao inicio() {

    real saldo = 0.0
    real valor
    inteiro opcao,senha
    logico controlador = verdadeiro

    enquanto (verdadeiro) {
      escreva("Digite a senha, dica o número do amigo: ")
      leia(senha)

      se (senha == 24) {
        escreva("Acesso permitido!\n")
        pare
      }
      senao {
        escreva("Senha inválida! Tente novamente.\n\n")
      }
    }
    
    
    escreva("----- Caixa aberto! -----\n")

    enquanto(controlador){

      escreva("\nEscolha uma opção do menu:\n")
      escreva("1 - Verificar saldo💵\n")
      escreva("2 - Depositar dinheiro💵(obs: Se for a primeira vez acessando, por favor digite seu saldo atual.) \n")
      escreva("3 - Sacar dinheiro💵\n")
      escreva("4 - Sair\n")

      leia(opcao)

      escolha(opcao){

        caso 1:
          escreva("\nSeu saldo atual é: R$ ", saldo🤑, "\n")
          pare

        caso 2:
          escreva("\nQuanto deseja depositar? R$ ")
          leia(valor)

          se(valor > 0){
            saldo = saldo + valor
            escreva("Depósito realizado com sucesso!\n")
            escreva("Novo saldo: R$ ", saldo💴 , "\n")
          }
          senao{
            escreva("Valor inválido!\n")
          
          pare
          }
        caso 3:
          escreva("\nQuanto deseja sacar? R$ ")
          leia(valor)

          se(valor > 0 e valor <= saldo){
            saldo = saldo - valor
            escreva("Saque realizado com sucesso!\n")
            escreva("Novo saldo: R$ ", saldo💳, "\n")
          }
          senao{
            escreva("Erro: Saldo insuficiente ou valor inválido!\n")
          }
          pare

        caso 4:
          escreva("Encerrando o programa...\n")
          controlador = falso
          pare

        caso contrario:
          escreva("Opção inválida!\n")
          pare
          
          }
        }
      }  
    }

