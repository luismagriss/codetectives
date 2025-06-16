*** Settings ***
Documentation        Cenários de testes na página de Login
Library              Browser
Resource             ../resources/pages/LoginPage.resource
Test Setup           Iniciar sessão

*** Test Cases ***
Login com campos em branco
    ${user}    Create Dictionary
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Submit sign up form    ${user}
    Click                  ${login_btn}

    Alert should be    Email é obrigatório
    Alert should be    Password é obrigatório
    
Login com dados válidos
    ${user}    Create Dictionary
    ...        email=teste123@qa.com
    ...        password=teste123
    
    Submit sign up form    ${user}
    Click                  ${login_btn}
    Jumbotron should contain text