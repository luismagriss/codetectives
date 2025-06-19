*** Settings ***
Documentation    Testes de cadastro de usuários
Library         Browser

Resource        ../resources/base.resource
Resource    ../dynamics/UserDynamic.robot
Resource    ../resources/user.keywords.resource

Suite Setup     Start Session
Suite Teardown  Close Browser            

*** Test Cases ***
Cadastro com dados válidos
    [Tags]    cadastro_valido
    Go to User Page
    Gerar Usuario Valido
    Cadastrar Usuario Válido
Cadastro com email inválido
    [Tags]    email_invalido
    Go to User Page
    Gerar Usuario com email inválido
    
Cadastro com campos em branco
    [Tags]    dados_vazios
    Go to User Page
    Dados em branco

Cadastro com email já utilizado
    [Tags]    email_duplicado
    Go to User Page
    Gerar Usuario Valido
    Cadastrar Usuario Válido
    Go to User Page
    Cadastrar Usuario duplicado
    

Cadastro com senha inferior a 5 caracteres
    [Tags]    senha_curta
    Go to User Page
    Validar senha curta 
