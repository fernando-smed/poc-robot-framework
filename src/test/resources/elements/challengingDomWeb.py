#funcao para retornar os seletores dos botoes principais
#o numero do botao deve ser informado e entao sera retornado o xpath do mesmo
def botaoPrincipal(numero):
    elementoBotao = '/html/body/div[2]/div/div/div/div/div[1]/a[' + str(numero) + ']'
    return elementoBotao

#funcao para retornar os seletors dos botoes edit
#a linha da tabela deve ser informada e entao sera retornado o xpath do botao edit daquela linha
def botaoEdit(linha):
    elementoEdit = '//*[@id="content"]/div/div/div/div[2]/table/tbody/tr[' + str(linha) + ']/td[7]/a[1]'
    return elementoEdit

#funcao para retornar os seletors dos botoes delete
#a linha da tabela deve ser informada e entao sera retornado o xpath do botao delete daquela linha
def botaoDelete(linha):
    elementoDelete = '//*[@id="content"]/div/div/div/div[2]/table/tbody/tr[' + str(linha) + ']/td[7]/a[2]'
    return elementoDelete