#!/bin/bash

# Definindo o diretório onde o WoW será instalado
WOW_DIR="/home/jogos/wow"
WOW_ZIP_URL="https://link-para-o-arquivo.zip"  # Substitua por seu link de download

# Passo 1: Instalar dependências (Wine e ferramentas de descompactação)
echo "Instalando dependências..."
sudo dnf install -y wine unzip wget

# Passo 2: Criar diretório para o WoW
echo "Criando diretório de instalação..."
mkdir -p "$WOW_DIR"

# Passo 3: Baixar o cliente WoW via wget
echo "Baixando o cliente WoW..."
wget "$WOW_ZIP_URL" -O /tmp/wow.zip

# Passo 4: Descompactar o arquivo ZIP
echo "Descompactando o cliente WoW..."
unzip /tmp/wow.zip -d "$WOW_DIR"

# Passo 5: Renomear a pasta 'World of Warcraft' para 'wow'
echo "Renomeando a pasta 'World of Warcraft' para 'wow'..."
mv "$WOW_DIR/World of Warcraft" "$WOW_DIR/wow"

# Passo 6: Configurar o Wine para rodar o WoW
echo "Configurando o Wine..."
winecfg

# Passo 7: Criar o script de inicialização
echo "Criando o script de inicialização..."

cat > "$WOW_DIR/start_wow.sh" <<EOL
#!/bin/bash

# Iniciar o WoW com o Wine
echo "Iniciando o WoW..."
wine "$WOW_DIR/wow/WoW.exe"
EOL

# Passo 8: Dar permissão de execução ao script de inicialização
chmod +x "$WOW_DIR/start_wow.sh"

echo "Instalação concluída!"
echo "O script de inicialização foi criado em: $WOW_DIR/start_wow.sh"
echo "Agora você pode iniciar o WoW executando o script 'start_wow.sh'."
