# Codetectives Test Automation

Projeto de automação de testes usando Robot Framework e Browser Library.

## Estrutura do Projeto

```
codetectives/
├── libs/                  # Bibliotecas personalizadas
├── resources/             # Recursos compartilhados
│   ├── data/              # Dados de teste
│   ├── pages/             # Page Objects
│   ├── base.resource      # Configurações base
│   ├── env.resource       # Variáveis de ambiente
│   └── helpers.resource   # Keywords auxiliares
├── tests/                 # Casos de teste
│   ├── Login.robot        # Testes de login
│   ├── Products.robot     # Testes de produtos
│   └── Users.robot        # Testes de usuários
└── results/               # Resultados dos testes
```

## Pré-requisitos

- Python 3.7+
- Robot Framework
- Browser Library

## Instalação

```bash
pip install robotframework
pip install robotframework-browser
rfbrowser init
```

## Execução dos Testes

Para executar todos os testes:
```bash
robot -d results tests/
```

Para executar testes específicos:
```bash
robot -d results -i smoke tests/
```

## Tags Disponíveis

- `smoke`: Testes críticos para verificação rápida
- `positive`: Cenários de caminho feliz
- `negative`: Cenários de validação e erro
- `security`: Testes relacionados à segurança
- `validation`: Testes de validação de campos

## Boas Práticas

1. Seguir padrão BDD (Given/When/Then) nos comentários
2. Manter dados de teste separados dos casos de teste
3. Usar tags para categorizar os testes
4. Documentar todos os casos de teste e keywords
5. Manter os seletores centralizados nos arquivos de Page Objects