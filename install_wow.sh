#!/bin/bash

# Definindo os diretórios
WOW_DIR="/home/jogos/wow"
WOW_ZIP_URL_DROPBOX="https://www.dropbox.com/scl/fi/pn0cj7x9y4fid9gzayp1f/World-of-Warcraft.zip?rlkey=rb67i6hk2xjx0t16vkn7kolii&st=v28hw6vr&dl=1"  # Link direto do Dropbox

# Passo 1: Instalar dependências (Wine e ferramentas de descompactação)
echo "Instalando dependências..."
sudo apt update
sudo apt install -y wine64 wine32 unzip wget

# Passo 2: Criar diretório para o WoW
echo "Criando diretório de instalação..."
mkdir -p "$WOW_DIR"

# Passo 3: Baixar o cliente WoW do Dropbox usando wget
echo "Baixando o cliente WoW do Dropbox..."
wget "$WOW_ZIP_URL_DROPBOX" -O /tmp/wow.zip

# Passo : Descompactar o arquivo ZIP do WoW
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
