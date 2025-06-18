#  Code Review - Squad QAspirants

---

###  Informações da Revisão

| Item                          | Detalhes                                                                 |
|-------------------------------|--------------------------------------------------------------------------|
| **Squad Revisora**           | Codetectives                                                              |
| **Squad Avaliada**           | QAspirants                                                                |
| **Repositório Avaliado**     | [QAspirants - GitHub](https://github.com/Eduarda-Correia/QAspirants)      |
| **Data da Revisão**          | 18/06/2025                                                                |

---

##  Pontos Positivos

-  Estrutura de pastas bem definida e segmentada por responsabilidade (`fixtures`, `pages`, `components`)
-  Casos de teste organizados por funcionalidade (`products`, `shoppingList`, `users`), favorecendo escalabilidade
-  Inclusão de relatórios de execução e screenshots automáticos, facilitando análise e debug
-  Uso eficiente da `FakerLibrary` para geração de dados dinâmicos
-  Utilização correta da keyword `Wait For Elements State`, evitando falhas intermitentes
-  Abstração clara de componentes como `Header`, com verificação por tipo de usuário (administrador e comum)
-  Testes bem segmentados por método HTTP (`POST`, `GET`, `DELETE`)
-  Padronização no uso de `Test Setup` e `Test Teardown` em todos os testes

---

##  Pontos a Melhorar


- Falta de verificação do resultado do cadastro: após o Signup as Administrator/User, não há validação se o usuário foi realmente cadastrado/logado.
  
Sugestão:

```robot

User should be logged in    ${user}[name]

 ```

-  Em /resources/pages/components/Header.resource;

A keyword Get Text com o uso de equal pode causar confusão, pois Get Text apenas retorna o valor do elemento. Caso a intenção seja realizar uma comparação, o mais adequado seria utilizar a keyword Should Be Equal As Strings.

  ```robot
  ${text}=    Get Text    ${element}
  Should Be Equal As Strings    ${text}    Bem Vindo ${name} 
```

---
##  Comentários Gerais

Conclui-se que, em geral, o projeto apresenta uma boa organização estrutural, com pastas bem segmentadas por responsabilidade, uso inteligente de dados dinâmicos por meio da FakerLibrary. A separação clara entre dados, componentes e funcionalidades demonstra um cuidado notável com a escalabilidade e manutenibilidade do código. 
Além disso, os testes estão bem distribuídos por operação (POST, GET, DELETE) e mostram uma boa cobertura dos fluxos positivos. Como aprimoramento, sugere-se incluir validações mais robustas após ações críticas, padronizar nomenclaturas e ampliar a cobertura com cenários negativos. No geral, o projeto reflete um trabalho sólido, organizado e com domínio das ferramentas de automação utilizadas.



###  Revisores

| Nome                | Squad            |
|---------------------|------------------|
| Karen Késsia        | Codetectives     |
| Luís Magris         | Codetectives     |
| Raphael             | Codetectives     |
| Carolina Hoewell    | Codetectives     |

