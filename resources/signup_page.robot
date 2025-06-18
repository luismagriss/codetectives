*** Settings ***
Library  Browser
Resource   env.robot
Library     Collections
Resource     ../dynamics/UserDynamic.robot
*** Keywords ***
Acessar página de cadastro
    Go To    ${BASE_URL}/cadastrarusuarios
    Wait For Elements State    id=nome    visible    10
    Sleep    1s

Preencher formulário de cadastro
    [Arguments]    ${user}
    Fill Text    id=nome         ${user}[name]
    Fill Text    id=email        ${user}[email]
    Fill Text    id=password     ${user}[password]

Enviar formulário
    Wait For Elements State      css=button[type=submit]     visible    10     
    Click     css=button[type=submit]
    Sleep    1s

Ver mensagem de erro
    [Arguments]    ${mensagem}
    Wait For Elements State    css=.alert    visible    10
    ${texto}    Get Text    css=.alert
    Should Be Equal    ${texto}    ${mensagem}

Ver mensagem de sucesso
    Wait For Elements State    css=.alert-success    visible    10
