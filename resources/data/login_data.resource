*** Settings ***
Documentation    Dados de teste para testes de login

*** Variables ***
# Credenciais válidas
${VALID_EMAIL}        teste123@qa.com
${VALID_PASSWORD}     teste123

# Credenciais inválidas
${INVALID_EMAIL}      invalid@mail.com
${INVALID_PASSWORD}   teste321

# Mensagens de erro
${ERROR_REQUIRED_EMAIL}      Email é obrigatório
${ERROR_REQUIRED_PASSWORD}   Password é obrigatório
${ERROR_INVALID_CREDENTIALS}  Email e/ou senha inválidos