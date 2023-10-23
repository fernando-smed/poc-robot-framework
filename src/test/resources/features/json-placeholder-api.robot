Language: Portuguese
*** Settings ***
Library    SeleniumLibrary
Resource    ../../
Test Tags    teste-api    regression    backend

*** Test Cases ***
Scenario: consulta a lista de usuarios
    [Tags]    consulta-lista-de-usuarios
    Dado uma consulta de usuarios "geral"
    Quando a consulta for realizada na api json-placeholder
    Então a api deve retornar status code "200"
