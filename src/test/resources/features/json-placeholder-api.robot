Language: Portuguese
*** Settings ***
Library    SeleniumLibrary
Resource    ../../robot/br.com.poc.robotframework/steps/JsonPlaceholderApiSteps.robot
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
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "200"
        E o contrato deve estar correto

Scenario: consulta usuario inexistente
    [Tags]    consulta-usuario-inexistente
    Dado uma consulta de usuarios "inexistente"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "404"