*** Settings ***
Documentation        Cenários de testes na página de Login
Library              Browser
Resource             ../resources/base.resource
Resource             ../resources/data/login_data.resource
Test Setup           Start Session
Test Tags            login    authentication

*** Test Cases ***
Login com campos em branco
    [Documentation]    Verifica se os campos obrigatórios são validados
    [Tags]            negative    validation
    
    # When - Tenta fazer login com campos vazios
    ${user}    Create Dictionary
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Submit sign up form    ${user}
    Click                  ${login_btn}

    # Then - Sistema exibe mensagens de erro
    Alert should be    ${ERROR_REQUIRED_EMAIL}
    Alert should be    ${ERROR_REQUIRED_PASSWORD}
    
Login com dados válidos
    [Documentation]    Verifica se o login é bem-sucedido com credenciais válidas
    [Tags]            positive    smoke
    
    Cadastrar usuário padrão
    
    # Given - Usuário com credenciais válidas
    ${user}    Create Dictionary
    ...        email=${VALID_EMAIL}
    ...        password=${VALID_PASSWORD}
    
    # When - Faz login com credenciais válidas
    Go To Login Page
    Submit sign up form    ${user}
    Click                  ${login_btn}
    
    # Then - Login é bem-sucedido
    Message should contain

Login com senha incorreta
    [Documentation]    Verifica se o sistema rejeita login com senha incorreta
    [Tags]            negative    security
    
    # Given - Usuário com senha incorreta
    ${user}    Create Dictionary
    ...        email=${VALID_EMAIL}
    ...        password=${INVALID_PASSWORD}
    
    # When - Tenta fazer login com senha incorreta
    Submit sign up form    ${user}
    Click                  ${login_btn}
    
    # Then - Sistema exibe mensagem de erro
    Alert should be    ${ERROR_INVALID_CREDENTIALS}

Login com email não cadastrado
    [Documentation]    Verifica se o sistema rejeita login com email não cadastrado
    [Tags]            negative    security
    
    # Given - Usuário com email não cadastrado
    ${user}    Create Dictionary
    ...        email=${INVALID_EMAIL}
    ...        password=${VALID_PASSWORD}
    
    # When - Tenta fazer login com email não cadastrado
    Submit sign up form    ${user}
    Click                  ${login_btn}
    
    # Then - Sistema exibe mensagem de erro
    Alert should be    ${ERROR_INVALID_CREDENTIALS}