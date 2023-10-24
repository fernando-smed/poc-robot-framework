Language: Portuguese
*** Settings ***
Resource          ../../robot/br.com.poc.robotframework/steps/ChallengingDomWebSteps.robot
Test Tags         teste-web    regression    challenging-dom
Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Scenario: valida clique no primeiro botao
    [Tags]    valida-clique-no-primeiro-botao
    Set Selenium Speed      .2s
    Set Selenium Timeout    30s
    Dado que o usuario esteja na pagina challenging dom
    Quando o usuario clicar no botao "1"
    Então o valor do campo answer deve ser atualizado

Scenario: valida clique no segundo botao
    [Tags]    valida-clique-no-segundo-botao
    Set Selenium Speed      .2s
    Set Selenium Timeout    30s
    Dado que o usuario esteja na pagina challenging dom
    Quando o usuario clicar no botao "2"
    Então o valor do campo answer deve ser atualizado

Scenario: valida clique no terceiro botao
    [Tags]    valida-clique-no-terceiro-botao
    Set Selenium Speed      .2s
    Set Selenium Timeout    30s
    Dado que o usuario esteja na pagina challenging dom
    Quando o usuario clicar no botao "3"
    Então o valor do campo answer deve ser atualizado