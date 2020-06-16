*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    chrome
${URL}        https://adquirencia.dev.mobilpay.com.br/
&{ECPF}       cpf=228.491.458-66    nome=Sovertoni    nomemae=Nome Exemplo    cep=09341-120  numero=999  responsavel=Contato  email=conrado+00055@b2ml.com.br    telefone=(11) 9999-9999    conta=9999    agencia=999    parcelas=3

*** Keywords ***
Iniciar Browser
    Open BROWSER    about:blank    ${BROWSER}

Encerrar Browser    
    Close BROWSER

Abrir página de login do site
    Go to           ${URL}

Preencher email do usuário "${EMAIL}"
    Input Text                        xpath=//*[@id="login"]    ${EMAIL}

Preencher senha do usuário "${SENHA}"
    Input Text                        xpath=//*[@id="senha"]    ${SENHA}
    Log                               screenshot login
    Capture Page Screenshot           screenshot_login.png
    
Clicar no botão Acessar
    Click Element                     xpath=/html/body/app-root/div/app-login/div/div/div/div[2]/form/div[3]/button
    
Conferir se abre o site na página inicial "${HOME_PAGE}"
    Wait Until Element Is Visible     xpath=/html/body/app-root/div/app-layout/section/div/section/header/h2
    Element Text Should Be            xpath=/html/body/app-root/div/app-layout/section/div/section/header/h2    ${HOME_PAGE}
    Log                               screenshot home page
    Capture Page Screenshot           screenshot_home_page.png

Conferir se o usuário "${USUARIO}" logado está correto
    Element Text Should Be            xpath=//*[@id="userbox"]/a/div/span    ${USUARIO}    

Clicar no nome do usuário
    Click Element                     xpath=//*[@id="userbox"]/a/div/span
    Log                               screenshot conferir usuario logado
    Capture Page Screenshot           screenshot_user_right.png

Clicar no botão Sair
    Click Element                     xpath=//*[@id="userbox"]/div/ul/li[2]/a
    Log                               screenshot logout
    Capture Page Screenshot           screenshot_user_logout.png
    

Clicar na opção Vendas
    Wait Until Page Contains Element  xpath=//*[@id="amenu"]
    Click Element                     xpath=//*[@id="amenu"]

Clicar na opção Clientes
    Wait Until Page Contains Element  xpath=//*[@id="clientes"]
    Click Element                     xpath=//*[@id="clientes"]

Clicar no botão Cadastrar novo cliente
    Wait Until Page Contains Element  xpath=//*[@id="cadastrocliente"]
    Click Button                      xpath=//*[@id="cadastrocliente"]

Preencher dados do novo cliente
    # Definir Pessoal Física
    Wait Until Element Is Visible     xpath=//*[@id="tipo"]/div/label
    Click Element                     xpath=//*[@id="tipo"]/div/label
    Wait Until Element Is Visible     xpath=//*[@id="tipo"]/div/div[4]/div/ul/p-dropdownitem[1]/li/span
    Click Element                     xpath=//*[@id="tipo"]/div/div[4]/div/ul/p-dropdownitem[1]/li/span
    Input Text                        xpath=//*[@id="pf"]                            ${ECPF.cpf}
    Input Text                        xpath=//*[@id="nome_completo"]                 ${ECPF.nome}
    Input Text                        xpath=//*[@id="nome_mae"]                      ${ECPF.nomemae}  
    Input Text                        xpath=//*[@id="num_cep"]                       ${ECPF.cep} 
    Input Text                        xpath=//input[@name="numero"]                  ${ECPF.numero}  
    # ------------------------------------ Definir Estado ----------------------------------------------- #
    # Click Element                     xpath=//label[@class="ng-tns-c12-34 ui-dropdown-label ui-inputtext ui-corner-all ng-star-inserted"]
    # Click Element                     xpath=//label[@class="ng-tns-c12-34 ui-dropdown-label ui-inputtext ui-corner-all ui-placeholder ng-star-inserted"]
    # ------------------------------------ Definir Cidade ----------------------------------------------- #
    # Click Element                     xpath=//label[@class="ng-tns-c12-41 ui-dropdown-label ui-inputtext ui-corner-all ng-star-inserted"]   
    # Click Element                     xpath=//label[@class="ng-tns-c12-41 ui-dropdown-label ui-inputtext ui-corner-all ng-star-inserted"]
    Input Text                        xpath=//input[@name="responsavel"]             ${ECPF.responsavel}
    Input Text                        xpath=//input[@name="email"]                   ${ECPF.email} 
    Input Text                        xpath=//input[@name="telefone"]                ${ECPF.telefone}
    # Input Text                        xpath=//input[@name="celular"]
    # -------------------------------- Definir Banco ----------------------------------------------- #
    Wait Until Element Is Visible     xpath=//label[@class="ng-tns-c12-35 ui-dropdown-label ui-inputtext ui-corner-all ui-placeholder ng-star-inserted"]
    Click Element                     xpath=//label[@class="ng-tns-c12-35 ui-dropdown-label ui-inputtext ui-corner-all ui-placeholder ng-star-inserted"]
    Wait Until Element Is Visible     xpath=//*[@id="banco"]/div/div[4]/div[2]/ul/p-dropdownitem[4]/li/span
    Click Element                     xpath=//*[@id="banco"]/div/div[4]/div[2]/ul/p-dropdownitem[4]/li/span
    # -------------------------------- Definir Tipo de Conta ----------------------------------------------- #
    Wait Until Element Is Visible     xpath=//*[@id="conta_tipo"]/div/label
    Click Element                     xpath=//*[@id="conta_tipo"]/div/label
    Wait Until Element Is Visible     xpath=//*[@id="conta_tipo"]/div/div[4]/div[2]/ul/p-dropdownitem[1]/li/span
    Click Element                     xpath=//*[@id="conta_tipo"]/div/div[4]/div[2]/ul/p-dropdownitem[1]/li/span
    Input Text                        xpath=//input[@name="conta"]                   ${ECPF.conta} 
    Input Text                        xpath=//input[@name="agencia"]                 ${ECPF.agencia}   
    # -------------------------------- Definir Tipo de Estabelecimento ----------------------------------------------- #
    Wait Until Element Is Visible     xpath=//*[@id="selectMccs"]/div/label
    Click Element                     xpath=//*[@id="selectMccs"]/div/label
    Wait Until Element Is Visible
    Click Element                     xpath=//*[@id="selectMccs"]/div/div[4]/div[2]/ul/cdk-virtual-scroll-viewport/div[1]/p-dropdownitem[10]/li/span
    Input Text                        xpath=//input[@name="maxParcelas"]             ${ECPF.parcelas} 

    Log                               screenshot cadastro EC PF
    Capture Page Screenshot           screenshot_cadastro_pf.png  

Clicar no botão salvar
    Wait Until Element Is Visible     xpath=//*[@id="btn_salvar"]
    Click Button                      xpath=//*[@id="btn_salvar"]