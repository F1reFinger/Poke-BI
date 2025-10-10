# Configuração do Ambiente de Desenvolvimento (Docker)

Como parte essencial dessa etapa silver é ter o ambiente configurado pelo docker, este documento descreve o passo a passo para configurar e executar o ambiente de desenvolvimento do projeto, que utiliza Docker e Docker Compose para gerenciar o banco de dados PostgreSQL da Pokedex.

## Pré-requisitos

Inicialmente, é necessário ter os seguintes softwares instalados no ambiente de desenvolvimento:
* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install/)


## Executando pela Primeira Vez

Os passos a seguir são para a **primeira execução** do ambiente ou caso tenha ocorrido alguma alteração nos arquivos de configuração do Docker.

### 1. Construir a Imagem e Subir os Contêineres
  
   Este comando lê o arquivo `docker-compose.yml` e constrói a imagem do banco de dados (pela flag `--build`) e inicia os serviços.

  ```bash
   docker-compose up --build
  ```

### 2. Verificar os Contêineres
 
  Em um novo terminal, este comando tem o objetivo de listar todos os contêineres e permitir verificar se o serviço está em execução (Up) ou se foi criado corretamente (Created/Exited).
  
  ```bash
   docker ps -a
  ```

**Observação:**  Na saída deste comando, é preciso identificar o CONTAINER ID do serviço de banco de dados para o próximo passo.

### Acessar o Contêiner

  Este comando concede acesso ao terminal dentro do contêiner do banco de dados, em que o ID é o obtido no comando anterior!

  ```bash
   docker exec -it <ID_DO_CONTAINER> bash
  ```

### 4. Conectar ao Banco de Dados

Já dentro do terminal do contêiner, a conexão ao banco de dados silver_db é feita com o usuário silver_user.

```bash
   psql -U silver_user -d silver_db
  ```

### 5. Listar as Tabelas

  Após a conexão, o comando \dt pode é usado para verificar se as tabelas da camada Silver foram criadas.

  ```bash
   \dt
  ```


