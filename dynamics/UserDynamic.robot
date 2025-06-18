*** Settings ***

Library    FakerLibrary

*** Keywords ***
Gerar Usuario Valido
    ${name}=    FakerLibrary.Name   
    ${email}=   FakerLibrary.Email
    ${password}=    FakerLibrary.Password    length=8    special_chars=False
    &{user}=    Create Dictionary    name=${name}    email=${email}    password=${password}    administrator=true
    RETURN    ${user}

Gerar Usuario Email Invalido
    ${name}=    FakerLibrary.Name    
    ${password}=    FakerLibrary.Password    length=8    special_chars=False
    &{user}=    Create Dictionary    name=${name}    email=emailinvalido    password=${password}   administrator=true
    RETURN    ${user}

Gerar Usuario Campos Vazios
    &{user}=    Create Dictionary    name=    email=    password=    administrator=true
    RETURN    ${user}

Gerar Usuario Email Duplicado
    [Arguments]    ${email_duplicado}
    ${name}=    FakerLibrary.Name     
    ${password}=    FakerLibrary.Password    length=8    special_chars=False
    &{user}=    Create Dictionary    name=${name}    email=${email_duplicado}    password=${password}   administrator=true
    RETURN    ${user}

Gerar Usuario Senha Curta
    ${name}=    FakerLibrary.Name    
    ${email}=   FakerLibrary.Email
    &{user}=    Create Dictionary    name=${name}    email=${email}    password=123    administrator=true
    RETURN    ${user}


