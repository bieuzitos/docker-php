# Docker com Apache 2.4, PHP 8.3.9, MySQL ou PostgreSQL

Este repositório contém um ambiente Docker configurado para desenvolvimento local com Apache, PHP, MySQL ou PostgreSQL. Utilize as instruções abaixo para configurar e executar o ambiente.

## Requisitos

- [Docker](https://www.docker.com/get-started)

## Instruções de Uso

1. **Clonar o Repositório:**

    ```bash
    git clone https://github.com/bieuzitos/docker-php.git

2. **Atualização dos Hosts:**

    No diretório `.docker/apache/bin`, execute o arquivo:

    ```cmd
    hosts.cmd
    ```

    Este comando criará as entradas necessárias para cada arquivo .conf em sites-enabled.

    **Nota:** Este passo é essencial para o correto funcionamento do sistema, pois apenas com os hosts devidamente configurados, o ambiente funcionará corretamente.

3. **Construir as Imagens:**

    Antes de iniciar os containers, é necessário construir as imagens. Execute o seguinte comando:

    ```bash
    docker-compose build

4. **Executar os Containers:**

    Execute o seguinte comando para iniciar os containers:

    ```bash
    docker-compose up -d

5. **Acessar Aplicações:**

    * Apache: Acesse https://localhost.dev no navegador.
    * PHP: Coloque seus arquivos PHP em public/.
    * MySQL: Use localhost:3306 com as credenciais configuradas.
    * PostgreSQL: Use localhost:5432 com as credenciais configuradas.

6. **Parar os Containers:**

    Para parar os containers, execute:

    ```bash
    docker-compose down

## Notas

Este ambiente é destinado para desenvolvimento local. Não o utilize em produção sem adequadas configurações de segurança.