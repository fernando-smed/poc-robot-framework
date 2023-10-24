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
    ELSE IF    $tipoConsulta == 'por nome'
        Set Global Variable    ${endpoint}    ${endpointUsuarios}?name=
    END

uma solicitacao de exclusao de usuario "${tipoExclusao}"
    IF    $tipoExclusao == 'por id'
        Set Global Variable    ${endpoint}    ${endpointUsuarios}/1
    ELSE
        Set Global Variable    ${endpoint}    ${endpointUsuarios}
    END

uma solicitacao de inclusao de um novo usuario
    ${json}        Load Json From File        ${EsquemaUsuario}
    ${body}        Get Value From Json        ${json}               examples[0]
    ${body}        Update Value To Json       ${body}               $..name            Fernando Medeiros
    ${body}        Update Value To Json       ${body}               $..username        Fern
    ${body}        Update Value To Json       ${body}               $..email           fernando.smed@gmail.com
    ${body}        Delete Object From Json    ${body}               $..id
    Set Suite Variable    ${body}

uma solicitacao de atualizacao de um usuario existente
    ${json}        Load Json From File        ${EsquemaUsuario}
    ${body}        Get Value From Json        ${json}               examples[0]
    ${body}        Update Value To Json       ${body}               $..email           nao.tem@teste.com
    ${body}        Delete Object From Json    ${body}               $..id
    Set Suite Variable    ${body}

o id do usuario e "${id}"
    Set Global Variable    ${endpoint}    ${endpointUsuarios}/${id}

o nome do usuario e "${nome}"
    Set Global Variable    ${endpoint}    ${endpoint}${nome}

a consulta for realizada na api json-placeholder
    ${responseLocal}        Enviar uma requisição com método GET    consultaUsuarios    ${baseUrlJsonPlaceholder}    ${endpoint}
    Set Global Variable     ${response}    ${responseLocal}

a solicitacao de exclusao for realizada
    ${responseLocal}        Enviar uma requisição com método DELETE    excluiUsuarios    ${baseUrlJsonPlaceholder}    ${endpoint}
    Set Global Variable     ${response}        ${responseLocal}

a solicitacao de insercao for realizada
    ${headers}    Create Dictionary    Content-type=application/json
    ${responseLocal}        Enviar uma requisição com método POST    adicionaUsuario    ${null}    ${baseUrlJsonPlaceholder}    ${endpointUsuarios}    ${headers}    json    ${body[0]}
    Set Global Variable    ${response}        ${responseLocal}

a solicitacao de atualizacao for realizada
    ${headers}             Create Dictionary    Content-type=application/json
    ${responseLocal}       Enviar uma requisição com método PUT    atualizaUsuario    ${null}    ${baseUrlJsonPlaceholder}    ${endpoint}    ${headers}    json    ${body[0]}
    Set Global Variable    ${response}        ${responseLocal}

a api deve retornar status code "${statusEsperado}"
    Status Should Be    ${statusEsperado}    ${response}

o contrato deve ser uma lista de usuarios
    Validate Json By Schema File    ${response.json()}    ${EsquemaListaUsuarios}

o contrato deve estar correto
    Validate Json By Schema File    ${response.json()}    ${EsquemaUsuario}

o campo "${campo}" deve ser "${valorEsperado}"
    ${valorResponse}                Get Value From Json    ${response.json()}    $..${campo}
    Should Be Equal As Strings      ${valorEsperado}       ${valorResponse[0]}