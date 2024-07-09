*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                  https://www.amazon.com.br/
${Menu_Eletronico}      //a[contains(.,'Eletrônicos')]
${Header_ELetronico}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${Texto_Eletronico}     Eletrônicos e Tecnologia


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome 
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
     

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep     10s
    Wait Until Element Is Visible    locator=${Menu_Eletronico}
    
Entrar no menu "Eletrônicos"
    Click Element    locator=${Menu_Eletronico} 

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${Texto_Eletronico}  
    Wait Until Element Is Visible    locator=${Header_ELetronico}

Verificar se o título da página fica "${Titulo}"
    Title Should Be    title=${Titulo}

Verificar se aparece a categoria "${Nome_Categoria}"
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${Nome_Categoria}')]

Digitar o nome de produto "${Nome_Produto}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox  text=${Nome_Produto}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto "${Nome_Produto}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${Nome_Produto}')]


# Gherkin STEPS##

Dado que estou na home page da Amazon.com.br
       Acessar a home page do site Amazon.com.br 
       Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
       Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática" 

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"


# DESAFIO STEPS

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Button    locator=a-autoid-1-announce
    Sleep     5s
Verificar se o produto "${Nome_Produto}" foi adicionado com sucesso
    Scroll Element Into View    locator=nav-cart
    Click Element    locator=nav-cart
    Page Should Contain Element    locator=[nav-cart-count]>0
    

Remover o produto "${Nome_Produto}" do carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${Nome_Produto}')]
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Page Does Not Contain    text="foi removido de Carrinho de compras."

# Gherkin STEPS DESAFIO##

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio