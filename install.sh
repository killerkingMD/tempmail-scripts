#!/bin/bash

# Função para exibir o menu com enfeites e gradiente de cores
show_menu() {
    echo -e "\e[38;5;196m========================================\e[0m"
    echo -e "\e[38;5;202mMenu: Gerador👑\e[0m"
    echo -e "\e[38;5;208m========================================\e[0m"
    echo -e "\e[38;5;196m█▀▀▀▀▀▀▀▀           ▀▀▀▀▀▀▀▀█\e[0m"
    echo -e "\e[38;5;214m1. Gerar um e-mail temporário\e[0m"
    echo -e "\e[38;5;220m2. Verificar a caixa de entrada\e[0m"
    echo -e "\e[38;5;226m3. Ler um e-mail específico\e[0m"
    echo -e "\e[38;5;190m4. Sair\e[0m"
    echo -e "\e[38;5;196m█▄▄▄▄▄▄▄▄           ▄▄▄▄▄▄▄▄█\e[0m"
    echo -e "\e[38;5;226mEscolha uma opção:\e[0m"
}

# Pergunta se o usuário deseja instalar o script
read -p "Você deseja instalar o script? (y/n): " choice

if [[ "$choice" != "y" ]]; then
    echo "Instalação cancelada."
    exit 0
fi

# URL do script Python no GitHub
SCRIPT_URL="https://raw.githubusercontent.com/USERNAME/tempmail-scripts/main/tem_mail.py"

# Nome do arquivo para o script Python
SCRIPT_NAME="tem_mail.py"

# Baixa o script Python usando wget
echo -e "\e[34mBaixando o script Python...\e[0m"
wget -O $SCRIPT_NAME $SCRIPT_URL

# Verifica se o wget foi bem-sucedido
if [ $? -eq 0 ]; then
    echo -e "\e[32mScript Python baixado com sucesso.\e[0m"
else
    echo -e "\e[31mErro ao baixar o script Python.\e[0m"
    exit 1
fi

# Instala as dependências necessárias
echo -e "\e[34mInstalando dependências...\e[0m"
pip install requests colorama

# Verifica se a instalação das dependências foi bem-sucedida
if [ $? -eq 0 ]; then
    echo -e "\e[32mDependências instaladas com sucesso.\e[0m"
else
    echo -e "\e[31mErro ao instalar as dependências.\e[0m"
    exit 1
fi

# Guia intuitiva para o usuário
echo
echo -e "\e[38;5;196m========================================\e[0m"
echo -e "\e[38;5;202mGuia Intuitiva de Uso do Script\e[0m"
echo -e "\e[38;5;208m========================================\e[0m"
echo
echo -e "\e[38;5;214m1. Para iniciar o Menu do script, execute o seguinte comando:\e[0m"
echo -e "\e[38;5;220m   python $SCRIPT_NAME\e[0m"
echo
echo -e "\e[38;5;226m2. No menu apresentado, escolha a opção 1 para gerar um e-mail temporário.\e[0m"
echo
echo -e "\e[38;5;190m3. Para verificar a caixa de entrada, escolha a opção 2.\e[0m"
echo
echo -e "\e[38;5;226m4. Para ler um e-mail específico, escolha a opção 3 e insira o ID do e-mail.\e[0m"
echo
echo -e "\e[38;5;220m5. Para sair do script, escolha a opção 4.\e[0m"
echo
echo -e "\e[38;5;196m========================================\e[0m"
echo -e "\e[38;5;202mFim da Guia Intuitiva\e[0m"
echo -e "\e[38;5;208m========================================\e[0m"

# Executa o script Python
echo -e "\e[34mExecutando o script Python...\e[0m"
python $SCRIPT_NAME
