*** Settings ***
Documentation    Testes de cadastro de usuários
Resource    ../resources/keywords_signup.robot
Library     Browser
Resource     ../dynamics/UserDynamic.robot
Suite Setup     Abrir Página de Cadastro
Suite Teardown  Close Browser

*** Test Cases ***
Cadastro com dados válidos
    ${user}=    Gerar Usuario Valido
    Acessar página de cadastro
    Preencher formulário de cadastro    ${user}
    Enviar formulário
    Ver mensagem de sucesso

Cadastro com email inválido
    ${user}=    Gerar Usuario Email Invalido
    Acessar página de cadastro
    Preencher formulário de cadastro    ${user}
    Enviar formulário
    Ver mensagem de erro    Email deve ser um email válido

Cadastro com campos em branco
    ${user}=    Gerar Usuario Campos Vazios
    Acessar página de cadastro
    Preencher formulário de cadastro    ${user}
    Enviar formulário
    Ver mensagem de erro    Nome é obrigatório

Cadastro com email já utilizado
    ${user}=    Carregar usuário    duplicate_email
    Acessar página de cadastro
    Preencher formulário de cadastro    ${user}
    Enviar formulário
    Ver mensagem de erro    Este email já está sendo usado

Cadastro com senha inferior a 5 caracteres
    ${user}=    Gerar Usuario Senha Curta
    Acessar página de cadastro
    Preencher formulário de cadastro    ${user}
    Enviar formulário
    Ver mensagem de erro    Senha deve ter no mínimo 6 caracteres
