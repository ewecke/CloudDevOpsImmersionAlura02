# Use uma imagem base do Python com uma versão específica e a distribuição Alpine Linux para uma imagem menor.
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências do projeto.  A flag --no-cache-dir evita o armazenamento de cache do pip, diminuindo o tamanho da imagem.
RUN pip install -r requirements.txt

# Copia todo o código da aplicação para o diretório de trabalho.
COPY . .

# Expõe a porta em que a aplicação FastAPI estará rodando.
EXPOSE 8000

# Define o comando para iniciar a aplicação usando Uvicorn. O parâmetro --host 0.0.0.0 permite que a aplicação seja acessível externamente.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]