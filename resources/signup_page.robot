*** Settings ***
Library  Browser
Resource   env.robot
Library     JSONLibrary
Library     Collections

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
    Wait For Elements State      data-testid=cadastrar     visible    10     
    Click     data-testid=cadastrar

Ver mensagem de erro
    [Arguments]    ${mensagem}
    Wait For Elements State    css=.alert-error >> text=${mensagem}    visible    5

Ver mensagem de sucesso
    Wait For Elements State    css=.notice-success    visible    5
