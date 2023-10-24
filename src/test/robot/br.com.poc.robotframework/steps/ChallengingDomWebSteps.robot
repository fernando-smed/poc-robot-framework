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

o usuario clicar no botao "${botao}" da linha "${linha}"
    IF    $botao == 'edit'
        clicar no botao edit      ${linha}
    ELSE
        clicar no botao delete    ${linha}
    END

o valor do campo answer deve ser atualizado
    ${valorFinal}    Busca valor do canvas answer
    Set Global Variable    ${valorFinal}
    Should Not Be Equal As Strings    ${valorInicial}    ${valorFinal}
    Capture Page Screenshot

o valor do campo answer deve permanecer o mesmo
    ${valorFinal}    Busca valor do canvas answer
    Set Global Variable    ${valorFinal}
    Should Be Equal As Strings    ${valorInicial}    ${valorFinal}
    Capture Page Screenshot

o botao "${botao}" da linha "${linha}" deve estar selecionado
    IF    $botao == 'edit'
        ${botaoEdit}    Botao Edit    ${linha}
        Element Should Be Focused     ${botaoEdit}
    ELSE
        ${botaoDelete}    Botao Delete    ${linha}
        Element Should Be Focused         ${botaoDelete}        
    END

Busca valor do canvas answer
    ${texto}    SeleniumLibrary.Get Element Attribute    xpath=//*[@id="content"]/script    text
    ${var}      Fetch From Right    ${texto}    Answer:
    ${result}   Fetch From Left     ${var}    '
    Return From Keyword    ${result}