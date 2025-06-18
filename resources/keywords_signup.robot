*** Settings ***
Resource    env.robot
Resource    signup_page.robot
Library     OperatingSystem
Library     Browser
Library     Collections
Library     JSONLibrary

*** Keywords ***

Abrir Página de Cadastro
    New Browser    chromium    headless=False
    New Page       https://front.serverest.dev/cadastrarusuarios
Carregar usuário
    [Arguments]    ${tipo}
    ${json}    Load JSON From File    ./fixtures/users.json
    ${user}    Get From Dictionary    ${json}    ${tipo}
    Set To Dictionary    ${user}    administrator=true
    RETURN    ${user}
