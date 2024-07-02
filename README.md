# Docker com Apache 2.4, PHP 8.3.8, MySQL ou PostgreSQL

Este repositório contém um ambiente Docker configurado para desenvolvimento local com Apache, PHP, MySQL ou PostgreSQL. Utilize as instruções abaixo para configurar e executar o ambiente.

## Requisitos

- [Docker](https://www.docker.com/get-started)

## Instruções de Uso

1. **Clonar o Repositório:**

    ```bash
    git clone https://github.com/bieuzitos/docker-php.git

2. **Configuração dos Certificados SSL:**

    Para configurar certificados SSL autoassinados, execute o seguinte comando dentro diretório /ssl:

    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt -config ../config/openssl.conf

3. **Executar os Containers:**

    Execute o seguinte comando para iniciar os containers:

    ```bash
    docker-compose up -d

4. **Acessar Aplicações:**

    * Apache: Acesse https://localhost.dev no navegador.
    * PHP: Coloque seus arquivos PHP em public/.
    * MySQL: Use localhost:3306 com as credenciais configuradas.
    * PostgreSQL: Use localhost:5432 com as credenciais configuradas.

5. **Parar os Containers:**

    Para parar os containers, execute:

    ```bash
    docker-compose down

## Configurações Adicionais

O Apache está configurado para usar SSL. Os certificados ficaram localizados em .docker/apache/ssl/.

## Notas

Este ambiente é destinado para desenvolvimento local. Não o utilize em produção sem adequadas configurações de segurança.