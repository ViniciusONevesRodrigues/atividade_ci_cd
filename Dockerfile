# Usar uma imagem oficial do Node.js como base
FROM node:14

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar os arquivos package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instalar as dependências do projeto
RUN npm install

# Copiar o restante dos arquivos da aplicação
COPY . .

# Expor a porta que a aplicação usa
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["node", "server.js"]
