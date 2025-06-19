*** Settings ***

Library    FakerLibrary
Library    Browser

*** Keywords ***
Gerar Usuario Valido
    ${name}=    FakerLibrary.Name   
    ${email}=   FakerLibrary.Email
    ${password}=    FakerLibrary.Password    length=8    special_chars=False
    Set Global Variable    ${name}
    Set Global Variable    ${email}
    Set Global Variable    ${password}
    #&{user}=    Create Dictionary    name=${name}    email=${email}    password=${password}    administrator=true
    #RETURN    ${user}

Preencher Campos Com Senha Curta
    [Arguments]    ${senha}
    ${nome}=    FakerLibrary.Name
    ${email}=   FakerLibrary.Email

    Fill Text    data-testid=nome       ${nome}
    Fill Text    data-testid=email      ${email}
    Fill Text    data-testid=password   ${senha}
    Wait For Elements State    data-testid=checkbox    visible    timeout=5s
    Click        data-testid=checkbox
    Click        data-testid=cadastrar    