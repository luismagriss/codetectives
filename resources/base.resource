*** Settings ***
Documentation        Keywords de uso geral

Library        Browser
Resource       ../variables/variables.resource
Resource       login_keywords.resource
Resource       products_keywords.resource
Resource       env.resource

*** Keywords ***
Start Session
    New Browser     browser=chromium      headless=False
    New Page        ${BASE_URL}

Go To Login Page
    Wait For Elements State    text=login    visible
    Click    text=login
    Wait For Elements State    id=email    visible

Fechar Navegador
    Close Browser    ALL

Go to User Page
    Go To    ${BASE_URL}/cadastrarusuarios
