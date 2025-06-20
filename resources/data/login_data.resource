*** Settings ***
Documentation    Dados de teste para testes de login
Library          FakerLibrary

*** Variables ***
# Credenciais válidas
# Credenciais inválidas
${INVALID_EMAIL}      invalid@mail.com
${INVALID_PASSWORD}   teste321

# Mensagens de erro
${ERROR_REQUIRED_EMAIL}      Email é obrigatório
${ERROR_REQUIRED_PASSWORD}   Password é obrigatório
${ERROR_INVALID_CREDENTIALS}  Email e/ou senha inválidos

