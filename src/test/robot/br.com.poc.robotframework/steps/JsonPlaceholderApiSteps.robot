*** Settings ***
Library    BuiltIn
Library    Collections
Library    JSONLibrary
Library    FakerLibrary
Resource    ../utils/rest/Requests.robot
*** Variables ***
${baseUrlJsonPlaceholder}        http://jsonplaceholder.typicode.com
${endpointUsuarios}              /users
${EsquemaUsuario}                src/test/robot/br.com.poc.robotframework/utils/json/JsonPlaceholderEsquemaUsuario.json
${EsquemaListaUsuarios}          src/test/robot/br.com.poc.robotframework/utils/json/JsonPlaceholderEsquemaListaUsuarios.json

*** Keywords ***
uma consulta de usuarios "${tipoConsulta}"
    IF    $tipoConsulta == 'geral'
        Set Global Variable    ${endpoint}    ${endpointUsuarios}
    ELSE IF    $tipoConsulta == 'por id'
        Set Global Variable    ${endpoint}    ${endpointUsuarios}/1
    ELSE
        Set Global Variable    ${endpoint}    ${endpointUsuarios}/100
    END

uma solicitacao de exclusao de usuario "${tipoExclusao}"
    IF    $tipoExclusao == 'por id'
        Set Global Variable    ${endpoint}    ${endpointUsuarios}/1
    ELSE
        Set Global Variable    ${endpoint}    ${endpointUsuarios}
    END

a consulta for realizada na api json-placeholder
    ${responseLocal}        Enviar uma requisição com método GET    consultaUsuarios    ${baseUrlJsonPlaceholder}    ${endpoint}
    Set Global Variable     ${response}    ${responseLocal}

a solicitacao de exclusao for realizada
    ${responseLocal}        Enviar uma requisição com método DELETE    excluiUsuarios    ${baseUrlJsonPlaceholder}    ${endpoint}
    Set Global Variable     ${response}        ${responseLocal}
    
a api deve retornar status code "${statusEsperado}"
    Status Should Be    ${statusEsperado}    ${response}

o contrato deve ser uma lista de usuarios
    Validate Json By Schema File    ${response.json()}    ${EsquemaListaUsuarios}

o contrato deve estar correto
    Validate Json By Schema File    ${response.json()}    ${EsquemaUsuario}
