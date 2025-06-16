*** Settings ***
Documentation        Keywords de uso geral

Library     Browser
Resource    env.resource

*** Keywords ***
Iniciar sessão
    New Browser     browser=chromium    headless=False
    New Page        ${BASE_URL}

