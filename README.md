
# RobotFramework Web Testing - Amazon Brasil 🛒

Este repositório contém testes automatizados para o site da Amazon Brasil, desenvolvidos como parte de um certificado em RobotFramework no nível básico. Os testes abrangem a navegação em sessões específicas da página inicial, buscas de produtos, e a adição e remoção de itens do carrinho de compras. Os testes foram realizados duas vezes: uma vez com keywords descritivas e outra seguindo BDD (Behavior-Driven Development) em Gherkin.

## Índice 📑

- [Introdução](#introdução)
- [Pré-requisitos](#pré-requisitos)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Executar os Testes](#como-executar-os-testes)
- [Contribuição](#contribuição)


## Introdução 📋

Este projeto foi criado para demonstrar habilidades básicas em automação de testes usando RobotFramework e Selenium. O foco principal é testar a funcionalidade de navegação e compra no site da Amazon Brasil.

## Pré-requisitos 🧰

Antes de começar, você vai precisar ter o seguinte instalado em sua máquina:

- Python 3.x
- RobotFramework
- SeleniumLibrary
- Webdriver para o navegador que você vai usar (por exemplo, ChromeDriver para Google Chrome)



## Estrutura do Projeto 👷‍♂️

```plaintext
web_challenge_basic_robotframework/
├── tests/
│   ├── amazon_testes.robot
│   ├── amazon_testes_gherkin_bdd.robot
│   
├──amazon_resources.robot
├── results/
│   ├── log.html
│   ├── report.html
│   ├── output.xml
├── README.md
├── screengrab/ 
```

- **tests/**: Contém os arquivos de teste.
- **screengrab/**: Contém screenshots dos testes
- **results/**: Contém os relatórios gerados após a execução dos testes.

## Como Executar os Testes 📝

Para executar todos os testes, use o seguinte comando no diretório raiz do projeto:

```sh
robot  -d /results amazon_testes.robot
```

Os relatórios e logs de execução dos testes serão gerados na pasta `results/`.

## Contribuição 🙋‍♂️

Contribuições são bem-vindas! Por favor, abra um problema ou envie um pull request para discutir mudanças que você gostaria de fazer.


---
