*** Settings ***
Library    String
Library    SeleniumLibrary
Resource    ../../../resources/PO/challengingDomWeb.robot

*** Variables ***
${link}    https://the-internet.herokuapp.com/challenging_dom

*** Keywords ***
Abrir navegador
    Open Browser    about:blank    chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

que o usuario esteja na pagina challenging dom
    Go To    ${link}
    Wait Until Element Is Enabled    id=canvas
    ${valorInicial}    Busca valor do canvas answer
    Set Global Variable    ${valorInicial}
    Capture Page Screenshot

o usuario clicar no botao "${numero}"
    clicar no botao principal    ${numero}

o valor do campo answer deve ser atualizado
    ${valorFinal}    Busca valor do canvas answer
    Set Global Variable    ${valorFinal}
    Should Not Be Equal As Strings    ${valorInicial}    ${valorFinal}
    Capture Page Screenshot

Busca valor do canvas answer
    ${texto}    SeleniumLibrary.Get Element Attribute    xpath=//*[@id="content"]/script    text
    ${var}      Fetch From Right    ${texto}    Answer:
    ${result}   Fetch From Left     ${var}    '
    Return From Keyword    ${result}