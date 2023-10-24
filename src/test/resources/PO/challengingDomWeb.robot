*** Settings ***
Library    SeleniumLibrary
Library    ../elements/challengingDomWeb.py

*** Keywords ***
clicar no botao principal
    [Arguments]      ${numero}
    ${botao}         Botao Principal    ${numero}
    Click Element    xpath=${botao}

clicar no botao edit
    [Arguments]      ${linha}
    ${botaoEdit}     Botao Edit    ${linha}
    Click Element    xpath=${botaoEdit}

clicar no botao delete
    [Arguments]       ${linha}
    ${botaoDelete}    Botao Delete    ${linha}
    Click Element     xpath=${botaoDelete}
