*** Settings ***
Documentation    Keywords da página de Login
Library    Browser
Resource    ../base.resource


*** Variables ***
${login_btn}    css=.btn-primary


*** Keywords ***
Submit sign up form
    [Arguments]    ${user}
    Fill Text    css=input#email.form-control       ${user}[email]
    Fill Text    css=input#password.form-control    ${user}[password]

Alert should be
    [Arguments]    ${expected_text}
    ${alert_element}      Set Variable    xpath=//div[contains(@class, 'alert')]//span[normalize-space(.)='${expected_text}']

    Wait For Elements State    ${alert_element}    visible    5
    Get Text    ${alert_element}    equal    ${expected_text}
    
Jumbotron should contain text
    ${alert_element}      Set Variable    css=.jumbotron h1

    Wait For Elements State    ${alert_element}    visible    5
    Get Text    ${alert_element}    contains    Bem Vindo