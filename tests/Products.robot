*** Settings ***
Documentation     Cenários de testes de produtos

Resource          ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot


*** Test Cases ***
Listar produtos via aba "Home"
    [Tags]    listar

    Generate Random User Data
    Register New User
    Fill Login Form                  ${EMAIL_CAD}      ${PASS_CAD}

    Go To With Button               css=a[data-testid=listarProdutos]
    Check If In Page                Lista dos Produtos


Listar produtos via menu de navegação
    [Tags]    listar

    New User and Login

    Go To With Button               css=a[data-testid=listar-produtos]
    Check If In Page                Lista dos Produtos


Acessar página de cadastro via aba "Home"
    [Tags]    ir_cadastro

    New User and Login

    Go To With Button               css=a[data-testid=cadastrarProdutos]
    Check If In Page                Cadastro de Produtos


Acessar página de cadastro via menu de navegação
    [Tags]    ir_cadastro

    New User and Login

    Go To With Button               css=a[data-testid=cadastrar-produtos]
    Check If In Page                Cadastro de Produtos


Cadastrar novo produto com dados válidos
    [Tags]    sucesso_cadastro

    New User and Login

    Go To With Button               css=a[data-testid=cadastrarProdutos]
    Check If In Page                Cadastro de Produtos

    Generate Random Product Data
    Submit Task Form For Product    ${product_data}
    Check If In Page                Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]


Impedir cadastro de produto com nome duplicado
    [Tags]    dup_cadastro

    New User and Login

    Go To With Button               css=a[data-testid=cadastrarProdutos]
    Check If In Page                Cadastro de Produtos

    Generate Random Product Data
    Submit Task Form For Product    ${product_data}
    Check If In Page                Lista dos Produtos
    Product Should Be Registered    ${product_data}[nome]

    Go To With Button               css=a[data-testid=cadastrar-produtos]
    Check If In Page                Cadastro de Produtos

    Submit Task Form For Product    ${product_data}
    Check If In Page                Cadastro de Produtos
    Alert Should Be                 Já existe produto com esse nome
