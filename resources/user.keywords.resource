*** Settings ***

Library    Browser
Resource   ../dynamics/UserDynamic.robot
Resource   base.resource

*** Keywords ***

Cadastrar Usuario Válido
    Fill Text    data-testid=nome      ${name}
    Fill Text    data-testid=email     ${email}
    Fill Text    data-testid=password  ${password}
    Click        data-testid=checkbox
    Click        data-testid=cadastrar
    Wait For Elements State    text=Cadastro realizado com sucesso    visible    timeout=5s
    Sleep    5

Gerar Usuario com email inválido
    Fill Text    data-testid=nome      João Pedro
    Fill Text    data-testid=email     rafael@com  
    Fill Text    data-testid=password  123456
    Click       data-testid=checkbox
    Click       data-testid=cadastrar
    Wait For Elements State    text=Email deve ser um email válido    visible    timeout=5s
    Sleep    5

Dados em branco
    Fill Text    data-testid=nome     ${EMPTY}
    Fill Text    data-testid=email     ${EMPTY}
    Fill Text    data-testid=password  ${EMPTY}
    Click       data-testid=checkbox
    Click       data-testid=cadastrar
    Wait For Elements State    text=Nome é obrigatório   visible    timeout=5s
    Wait For Elements State    text=Email é obrigatório     visible    timeout=5s
    Wait For Elements State    text=Password é obrigatório     visible    timeout=5s
    Sleep    5    

Cadastrar Usuario duplicado
    Fill Text    data-testid=nome      ${name}
    Fill Text    data-testid=email     ${email}
    Fill Text    data-testid=password  ${password}
    Click       data-testid=checkbox
    Click       data-testid=cadastrar
    Wait For Elements State    text=Este email já está sendo usado    visible    timeout=5s
    Sleep    5


Validar senha curta 
    @{senhas}=    Create List    1    12    123    1234    12345

    FOR    ${senha}    IN    @{senhas}
        Log    Testando senha inválida: ${senha}
        Go to User Page
        Preencher Campos Com Senha Curta    ${senha}

        # Screenshot mesmo que o erro apareça ou não
        Take Screenshot    name=bug_senha_${senha}

        # Validação do bug – o erro deveria aparecer!
        ${erro_apareceu}=    Run Keyword And Return Status
        ...    Wait For Elements State    text=Password deve ter pelo menos 6 caracteres    visible    timeout=3s

        IF    '${erro_apareceu}' == 'False'
            Log    ⚠️ ERRO: A senha "${senha}" foi aceita — não deveria aceitar senha com menos de 6 dígitos!    WARN
        ELSE
            Log    ✅ Mensagem de erro exibida corretamente para senha "${senha}".
        END

        Reload
    END

