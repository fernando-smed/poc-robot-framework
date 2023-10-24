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

Scenario: valida clique nos botoes da tabela
    [Tags]        valida-clique-nos-botoes-da-tabela
    [Template]    Scenario Outline: Valida clique nos botoes edit e delete de cada linha da tabela

    #Examples
    #botao        linha
    edit          1
    edit          2
    edit          3
    edit          4
    edit          5
    edit          6
    edit          7
    edit          8
    edit          9
    edit          10
    delete        1
    delete        2
    delete        3
    delete        4
    delete        5
    delete        6
    delete        7
    delete        8
    delete        9
    delete        10

*** Keywords ***
Scenario Outline: Valida clique nos botoes edit e delete de cada linha da tabela
    [Documentation]    Teste de aplicação web clicando em cada elemento da tabela
    [Tags]             teste-botoes-da-tabela
    [Arguments]        ${botao}      ${linha}
    Set Selenium Speed        .2s
    Set Selenium Timeout      30s
    Dado que o usuario esteja na pagina challenging dom
    Quando o usuario clicar no botao "${botao}" da linha "${linha}"
    Então o valor do campo answer deve permanecer o mesmo
        E o botao "${botao}" da linha "${linha}" deve estar selecionado