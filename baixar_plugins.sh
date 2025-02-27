#!/bin/bash

# Definições
REPO_URL="https://github.com/turbocloudoficial/softaculousplugins.git"
DEST_DIR="/usr/local/cpanel/whostmgr/docroot/cgi/softaculous/conf/sets/wp/plugins/"
TEMP_DIR="/tmp/softaculousplugins"

# Criar diretório temporário
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR" || exit 1

# Clonar o repositório
git clone "$REPO_URL" .

# Mover arquivos .zip para o destino, forçando a substituição
find "$TEMP_DIR" -type f -name "*.zip" -exec mv -f {} "$DEST_DIR" \;

# Limpar diretório temporário
rm -rf "$TEMP_DIR"

# Permissões corretas
chown -R root:root "$DEST_DIR"
chmod -R 644 "$DEST_DIR"/*.zip

echo "Plugins baixados e movidos para $DEST_DIR"