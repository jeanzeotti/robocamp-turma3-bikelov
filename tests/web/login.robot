*** Settings ***
Documentation       Login
...                 Para que eu possa ter acesso de interface de gestão de anúncios
...                 Sendo um usuário que possui um email
...                 Quero poder iniciar uma nova sessão

Resource            ../../resources/steps_key.robot

Suite Setup          Start Session
Suite Teardown       End Session

Test Teardown        End Test


*** Test Cases ***
Usuário consegue logar
    Dado que acesso a página login
    Quando eu submeto minha credencial de login "jeanz.pires@gmail.com"
    Então a área logada deve ser exibida

Usuário não loga com email incorreto
    [Template]      Tentar logar
    jeanz.piresgmail.com    Oops. Informe um email válido!

Email com caracter inválido
    [Template]      Tentar logar
    jeanz.pires&gmail.com   Oops. Informe um email válido!

Email deve ser obrigatório
    [Template]      Tentar logar
    ${EMPTY}                Oops. Informe um email válido!

*** Keywords ***
Tentar logar
    [Arguments]     ${email}    ${expect_message}

    Dado que acesso a página login
    Quando eu submeto minha credencial de login "${email}"
    Então devo ver a mensagem de alerta "${expect_message}"