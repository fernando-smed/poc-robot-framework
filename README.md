# poc-robot-framework

## Objetivo
Repositório destinado a demonstrar as funcionalidades do framework robot-framework para automação de testes de API e web.

## Visão geral

Os testes foram desenvolvidos utilizando o robot-framework (https://robotframework.org/), este framework dispõe de uma linguagem de programação mais amigável, o que facilita o tempo de aprendizagem para novos desenvolvedores. Outro ponto positivo é que o framework possui diversas bibliotecas, permitindo a automação de testes de api, web, mensageria, banco de dados, etc.

Os testes também foram desenvolvidos seguindo o padrão de BDD, trazendo uma linguagem de testes ainda mais fácil para o entendimento dos stakeholders.

 
#### Testes de API
Os testes de API foram desenvolvidos baseados na seguinte API:

http://jsonplaceholder.typicode.com/users

Foram desenvolvidos cenários para validar requisições com os verbos GET, POST, PUT e DELETE. O intuito do teste é realizar as requisições HTTP na API e fazer a validação do status code de resposta, body e schema. 

#### Teste Web
Os testes de aplicação Web foram desenvolvidos baseados na seguinte aplicação:

https://the-internet.herokuapp.com/challenging_dom

O intuito desses testes é realizar clique em diferentes botões e validar as ações geradas após o clique de cada botão.


---
## Pré requisitos para o desenvolvimento e execução dos testes
- Ter instalado o Python --> https://www.python.org/downloads/
- Ter instalado o chromedriver (mesma versão do chrome) --> https://chromedriver.chromium.org/downloads

PS: ambos devem estar com as variáveis de ambiente configuradas no SO. 
### Instalação das bibliotecas utilizadas no teste

    pip install -r ./resources/config/requirements.txt

A execução deste comando instala todas as bibliotecas utilizadas neste projeto, incluindo o robot-framework.
### Execução dos testes por tag
| Feature | Comando |
|------|-----------------------------------------------------|
|Testes API| robot -d results -i teste-api src/test/resources/features/*.robot|
|Testes Web|robot -d results -i teste-web src/test/resources/features/*.robot|
|Todos os testes|robot -d results -i regression src/test/resources/features/*.robot|

### Relatório dos testes
Após a execução dos testes, os logs de execução e o relatório ficarão disponíveis no diretório results.