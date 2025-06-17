*** Settings ***
Documentation    Keywords da página de Login
Library    Browser
Resource    ../base.resource

*** Variables ***
# Page elements
${login_btn}           css=.btn-primary
${email_field}         css=input#email.form-control
${password_field}      css=input#password.form-control
${welcome_message}     css=.jumbotron h1

*** Keywords ***
Submit sign up form
    [Arguments]    ${user}
    Fill Text    ${email_field}       ${user}[email]
    Fill Text    ${password_field}    ${user}[password]

Login with
    [Arguments]    ${email}    ${password}
    Fill Text    ${email_field}       ${email}
    Fill Text    ${password_field}    ${password}
    Click        ${login_btn}

Alert should be
    [Arguments]    ${expected_text}
    ${alert_element}      Set Variable    xpath=//div[contains(@class, 'alert')]//span[normalize-space(.)='${expected_text}']

    Wait For Elements State    ${alert_element}    visible    5
    Get Text    ${alert_element}    equal    ${expected_text}
    
Message should contain
    [Documentation]    Verifica que aparece a mensagem de boas-vindas após login bem sucedido.
    Wait For Elements State    ${welcome_message}    visible    5
    Get Text    ${welcome_message}    contains    Bem Vindo

Validate login page is loaded
    Wait For Elements State    ${email_field}    visible    5
    Wait For Elements State    ${password_field}    visible    5
    Wait For Elements State    ${login_btn}    visible    5