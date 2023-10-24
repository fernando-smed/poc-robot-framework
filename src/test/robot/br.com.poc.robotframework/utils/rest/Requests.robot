*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Enviar uma requisição com método POST
    [Arguments]       ${alias}          ${auth}            ${baseUrl}        ${endpoint}                   ${headers}            ${bodyType}            ${bodyRequest}
    Create Session    alias=${alias}    auth=${auth}       url=${baseUrl}    headers=${headers}            verify=false          disable_warnings=1     proxies=https
    ${response}       POST On Session   alias=${alias}     url=${endpoint}   ${bodyType}=${bodyRequest}    headers=${headers}    expected_status=any
    [Return]          ${response}

Enviar uma requisição com método GET
    [Arguments]       ${alias}          ${baseUrl}        ${endpoint}
    Create Session    alias=${alias}    url=${baseUrl}    verify=false       disable_warnings=1     proxies=https
    ${response}       GET On Session   alias=${alias}     url=${endpoint}    expected_status=any
    [Return]          ${response}

Enviar uma requisição com método DELETE
    [Arguments]       ${alias}          ${baseUrl}        ${endpoint}
    Create Session    alias=${alias}    url=${baseUrl}    verify=false       disable_warnings=1     proxies=https
    ${response}       DELETE On Session   alias=${alias}     url=${endpoint}    expected_status=any
    [Return]          ${response}

Enviar uma requisição com método PUT
    [Arguments]       ${alias}          ${auth}            ${baseUrl}        ${endpoint}                   ${headers}            ${bodyType}            ${bodyRequest}
    Create Session    alias=${alias}    auth=${auth}       url=${baseUrl}    headers=${headers}            verify=false          disable_warnings=1     proxies=https
    ${response}       PUT On Session   alias=${alias}     url=${endpoint}   ${bodyType}=${bodyRequest}    headers=${headers}    expected_status=any
    [Return]          ${response}