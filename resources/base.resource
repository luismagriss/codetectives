*** Settings ***
Documentation        Keywords de uso geral

Library        Browser
Resource       login_keywords.resource
Resource       products_keywords.resource
Resource       env.resource
Resource       ./pages/LoginPage.resource
Resource       ./user.keywords.resource
Resource       ./data/login_data.resource

*** Keywords ***
Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}

Go To Login Page
    Go to    ${BASE_URL}/login
    Wait For Elements State    text=login    visible
    Click    text=login
    Wait For Elements State    id=email    visible

Fechar Navegador
    Close Browser    ALL

Go to User Page
    Go To    ${BASE_URL}/cadastrarusuarios

Alert should be
    [Arguments]        ${expected_text}

    Wait For Elements State        xpath=//span[text()="${expected_text}"]
    ...                            visible        5

Cadastrar usuário padrão
    ${VALID_NAME}         FakerLibrary.Name
    ${VALID_EMAIL}        FakerLibrary.Email
    ${VALID_PASSWORD}     FakerLibrary.Password    length=8    special_chars=False
    Set Global Variable    ${VALID_EMAIL}
    Set Global Variable    ${VALID_PASSWORD}
    Go to User Page
    ${user}        Create Dictionary
    ...            name=${VALID_NAME}
    ...            email=${VALID_EMAIL}
    ...            password=${VALID_PASSWORD}
    Fill Text    data-testid=nome        ${VALID_NAME}
    Fill Text    data-testid=email       ${VALID_EMAIL}
    Fill Text    data-testid=password    ${VALID_PASSWORD}
    Click        data-testid=checkbox
    Click        data-testid=cadastrar
    Wait For Elements State    text=Cadastro realizado com sucesso    visible    timeout=5s
    Sleep    5