#!/bin/bash

# Diretório onde o WoW será instalado
WOW_DIR="$HOME/jogos/wow"
WOW_ZIP_URL_DROPBOX="https://www.dropbox.com/scl/fi/pn0cj7x9y4fid9gzayp1f/World-of-Warcraft.zip?dl=1"  # Link direto do Dropbox

# Passo 1: Criar diretório para o WoW
echo "Criando diretório de instalação em $WOW_DIR..."
mkdir -p "$WOW_DIR"

# Passo 2: Baixar o cliente WoW do Dropbox usando wget
echo "Baixando o cliente WoW do Dropbox..."
wget "$WOW_ZIP_URL_DROPBOX" -O /tmp/wow.zip

# Passo 3: Descompactar o arquivo ZIP do WoW
echo "Descompactando o cliente WoW..."
unzip /tmp/wow.zip -d "$WOW_DIR"

# Passo 4: Renomear a pasta 'World of Warcraft' para 'wow'
echo "Renomeando a pasta 'World of Warcraft' para 'wow'..."
mv "$WOW_DIR/World of Warcraft" "$WOW_DIR/wow"

# Passo 5: Configurar o Wine para rodar o WoW
echo "Configurando o Wine..."
winecfg

# Passo 6: Criar o script de inicialização
echo "Criando o script de inicialização..."

cat > "$WOW_DIR/start_wow.sh" <<EOL
#!/bin/bash

# Iniciar o WoW com o Wine
echo "Iniciando o WoW..."
wine "$WOW_DIR/wow/WoW.exe"
EOL

# Passo 7: Dar permissão de execução ao script de inicialização
chmod +x "$WOW_DIR/start_wow.sh"

# Passo 8: Perguntar se o usuário quer iniciar o jogo
echo "Deseja iniciar o World of Warcraft agora? (y/n)"
read iniciar_jogo

if [[ "$iniciar_jogo" == "y" || "$iniciar_jogo" == "Y" ]]; then
    echo "Iniciando o WoW..."
    "$WOW_DIR/start_wow.sh"
else
    echo "O WoW não será iniciado. Você pode iniciá-lo manualmente com o script 'start_wow.sh'."
fi
