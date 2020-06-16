*** Settings ***
Resource          ../resource/resource.robot
Test Setup        Iniciar Browser
Test Teardown     Encerrar Browser

*** Test Cases ***
Caso de Teste 01: Realizar Login
    [Tags]    caso01
    Abrir página de login do site
    Preencher email do usuário "luiz.guilherme@b2ml.com.br"
    Preencher senha do usuário "123456"
    Clicar no botão Acessar
    Conferir se abre o site na página inicial "Página Inicial"
    Conferir se o usuário "Luiz Root" logado está correto
    Clicar no nome do usuário
    Clicar no botão Sair

# Caso de Teste 02: Recuperar Senha
#    [Tags]    caso02
#    Clicar no link Esqueci minha senha
#    Preencher campo com email
#    Clicar no botão Recuperar

Caso de Teste 03: Cadastrar Estabelecimento Comercial
    [Tags]    caso03
    Abrir página de login do site
    Preencher email do usuário "luiz.guilherme@b2ml.com.br"
    Preencher senha do usuário "123456"
    Clicar no botão Acessar
    Clicar na opção Vendas
    Clicar na opção Clientes
    Clicar no botão Cadastrar novo cliente
    Preencher dados do novo cliente
    Clicar no botão salvar
    Clicar no nome do usuário
    Clicar no botão Sair

# Caso de Teste 04: Cadastrar Vendedor
#    [Tags]    caso04
#    Abrir página de login do site
#    Preencher email do usuário "luiz.guilherme@b2ml.com.br"
#    Preencher senha do usuário "123456"
#    Clicar no botão Acessar
#    Clicar no nome do usuário
#    Clicar no botão Sair




