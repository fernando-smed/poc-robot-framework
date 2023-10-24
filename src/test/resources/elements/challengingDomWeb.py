def botaoPrincipal(numero):
    elementoBotao = '/html/body/div[2]/div/div/div/div/div[1]/a[' + str(numero) + ']'
    return elementoBotao

def botaoEdit(linha):
    elementoEdit = '//*[@id="content"]/div/div/div/div[2]/table/tbody/tr[' + str(linha) + ']/td[7]/a[1]'
    return elementoEdit

def botaoDelete(linha):
    elementoDelete = '//*[@id="content"]/div/div/div/div[2]/table/tbody/tr[' + str(linha) + ']/td[7]/a[2]'
    return elementoDelete