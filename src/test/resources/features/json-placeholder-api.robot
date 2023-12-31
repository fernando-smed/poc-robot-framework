Language: Portuguese
*** Settings ***
Library      SeleniumLibrary
Resource     ../../robot/br.com.poc.robotframework/steps/JsonPlaceholderApiSteps.robot
Test Tags    teste-api    regression    backend

*** Test Cases ***
Scenario: consulta a lista de usuarios
    [Tags]    consulta-lista-de-usuarios
    Dado uma consulta de usuarios "geral"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "200"
        E o contrato deve ser uma lista de usuarios

Scenario: consulta usuario por id
    [Tags]    consulta-usuario-por-id
    Dado uma consulta de usuarios "por id"
        E o id do usuario e "1"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "200"
        E o contrato deve estar correto

Scenario: consulta usuario inexistente
    [Tags]    consulta-usuario-inexistente
    Dado uma consulta de usuarios "por id"
        E o id do usuario e "inexistente"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "404"

Scenario: consulta usuario por nome
    [Tags]    consulta-usuario-por-nome
    Dado uma consulta de usuarios "por nome"
        E o nome do usuario e "Patricia Lebsack"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "200"
Scenario: exclui usuario por id
    [Tags]    exclui-usuario-por-id
    Dado uma solicitacao de exclusao de usuario "por id"
    Quando a solicitacao de exclusao for realizada
    Então a api deve retornar status code "200"

Scenario: tenta excluir usuario inexiste
    [Tags]    exclui-usuario-inexistente
    Dado uma solicitacao de exclusao de usuario "inexistente"
    Quando a solicitacao de exclusao for realizada
    Então a api deve retornar status code "404"

Scenario: adiciona novo usuario
    [Tags]    adiciona-novo-usuario
    Dado uma solicitacao de inclusao de um novo usuario
    Quando a solicitacao de insercao for realizada
    Então a api deve retornar status code "201"
        E o campo "name" deve ser "Fernando Medeiros"
        E o campo "email" deve ser "fernando.smed@gmail.com"

Scenario: atualiza usuario existente
    [Tags]    atualiza-usuario-existente
    Dado uma solicitacao de atualizacao de um usuario existente
        E o id do usuario e "5"
    Quando a solicitacao de atualizacao for realizada
    Então a api deve retornar status code "200"