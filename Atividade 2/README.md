# Atividade Docker

Repositório para a atividade de Docker, do programa de bolsas da Compass UOL.


**Arquitetura do Projeto**:

---
## Passo a Passo

### Criando uma VPC
- Na AWS busque por `VPC`.

- No menu de VPC clique em `Criar VPC`.

- Ao criar a VPC selecione para criar um NAT Gateway.

<details>
<summary>Adicionar NAT Gateway após criar a VPC</summary>

- Após criar a VPC ainda no menu vá até `Gateways NAT`.

- Clique em `Criar gateway NAT`.

- Nomeie o Nat Gateway e em `Sub-rede` selecione uma das sub-redes públicas.

- Mantenha `Tipo de conectividade` como público.

- Em seguida clique em `Criar gateway NAT`.

- Após criar o NAT gateway, acesse `Tabelas de rotas`.

- Na `Tabela de rotas` selecione as rotas privadas, clique em `Ações` e selecione `Editar rotas`, será necessário realizar isso para as duas rotas.

- Em `Editar rotas` em `destino` selecione `0.0.0/0`

- Em Alvo selecione `Gateway NAT` e selecione o NAT gateway criado anteriormente.

- Clique em `Salvar alterações`.

</details>

- Para verificar se sua VPC está correta acesse `Suas VPCs` em seguida selecione a VPC criada anteriormente e a opção `Resource map` e verifique se está de acordo com a imagem abaixo.


### Criando Securitys Groups
- No menu EC2 procure por `Security groups` na barra de navegação à esquerda.


- Acesse e clique em `Criar novo grupo de segurança`, e crie os grupos de segurança a seguir.


#### EFS
| Tipo | Protocolo | Intervalo de portas | Origem | Descrição |
| ---|---|---|---|--- |
| TCP personalizado | TCP | 2049 | 0.0.0.0/0 | NFS |
| UDP personalizado | UDP | 2049 | 0.0.0.0/0 | NFS |

#### EC2
| Tipo | Protocolo | Intervalo de portas | Origem | Descrição |
| ---|---|---|---|--- |
| SSH | TCP | 22 | 0.0.0.0/0 | SSH |
| TCP personalizado | TCP | 80 | 0.0.0.0/0 | HTTP |
| TCP personalizado | TCP | 443 | 0.0.0.0/0 | HTTPS |

#### RDS
| Tipo | Protocolo | Intervalo de portas | Origem | Descrição |
| ---|---|---|---|--- |
| TCP personalizado | TCP | 3306 | 0.0.0.0/0 | RDS |

#### Endpoint

Permita somente conexões out bound.

### Criando um EFS
- Busque por `EFS` na Amazon AWS o serviço de arquivos de NFS escalável da AWS.


- Na Página de EFS clique em `Criar sistema de arquivos`.


### Criando o RDS
- Busque por RDS na Amazon AWS.

- Na página de RDS clique em `Criar banco de dados`.

- Na página de `Criar banco de dados` selecione `Criação padrão`.

- Em `Opções do mecanismo` selecione `MySQL`.

- Como `Versão do mecanismo` selecione `MySQL 8.0.33`.

- Em `Modelos` selecione `Nível gratuito`.

- Na aba `Configurações` preencha o `Nome do usuário principal` e a `Senha principal` que serão utilizados no Script.

- Em `Configuração da instância` selecione como classe `db.t3.micro`.

- Na aba `Armazenamento` desabilite a opção `Habilitar escalabilidade automática do armazenamento`.

- Na aba `Conectividade` selecione `Não se conectar a um recurso de computação do EC2` e selecione a VPC criada anteriormente em VPC.

- Na opção `Acesso público` selecione sim.

- Em `Grupo de segurança de VPC (firewall)` selecione o Security group criado anteriormente para o RDS

- Na aba `Configuração adicional` preencha `Nome do banco de dados inicial` será necessário para o Script.

- Clique em `Criar banco de dados`

### Modelo de execução
- No menu EC2 procure por `Modelo de execução` na barra de navegação à esquerda.

- Acesse e clique em `Criar modelo de execução`.

- Nomeie o modelo de execução, e opcionalmente dê ao modelo uma descrição.

- Em `Imagens de aplicação e de sistema operacional` selecione Amazon Linux 2.

- Na aba `Tipo de instância` selecione t2.micro.

- Selecione uma chave existente ou crie uma nova em `Par de chaves`.

- Em `Configurações de rede` não inclua uma sub-rede no modelo, e selecione o grupo de segurança criado anteriormente. 

- Na aba `Armazenamento` selecione 8GiB de gp2.

- Adicione as tags necessárias a suas instância em `Tags de recurso`.

- A duas opções ao utilizar o Script, utilizar ele e criar o arquivo do docker-compose ou então criar o arquivo do docker-compose fora do Script.

<details>
<summary>Utilizar o Script para a criação do docker-compose</summary>


</details>

<details>
<summary>Criar o docker-compose separadamente</summary>

- Em `Detalhes avançados` copie para `Dados do usúario` o Script que pode ser encontrado e altere as variaveis necessarias que estão marcadas por <>.

- Como o Script não criará o arquivo docker-compose necessário para inicialização dos contêineres será necessário alguns passo adicionais.

- Será necessario criar e executar uma instancia EC2 conectada ao EFS criado anteriormente, instuções detalhadas podem ser encontradas.

- Acesse a instância e navegue até o diretório `/mnt/efs`.

- Crie um arquivo através  do comando:

```
vi docker-compose.yml
```

- Copie ou digite para o arquivo o conteúdo a seguir, respeitando a formatação.

```
    services:
      wordpress:
        image: wordpress:latest
        volumes:
          - /mnt/efs/wordpress:/var/www/html
        ports:
          - "80:80"
        environment:
          WORDPRESS_DB_HOST: <RDS End point>
          WORDPRESS_DB_USER: <RDS Master Username>
          WORDPRESS_DB_PASSWORD: <Master Password>
          WORDPRESS_DB_NAME: <RDS name, selected in additional settings>
          WORDPRESS_TABLE_CONFIG: wp_
```

- Altere as variáveis necessárias que estão marcadas com <>.

- Siga os passos restantes até o fim do tutorial e uma vez que as instâncias estejam rodando delete a instância criada para a criação do arquivo docker-compose.

</details>

- Ao terminar de alterar o StartScript clique em `Criar modelo de execução`.

### Target Group
- No menu EC2 procure por `Grupos de destino` na barra de navegação à esquerda.

- Acesse e clique em `Criar grupo de destino`.

- Em `Escolha um tipo de destino` clique em `Instâncias`.

- Nomeie o grupo de destino.

- Em `Protocolo` mantenha `HTTP` e em `Porta` mantenha a porta `80`.

- Como `VPC` selecione a VPC criada anteriormente.

- Mantenha a `Versão do protocolo` como `HTTP1`.

- A seguir clique em `Próximo`.

- Na página de `Registrar destinos` não selecione nenhuma instância.

- Selecione `Criar grupo de destino`.

### Load Balancer
- No menu EC2 procure por `load Balancer` na barra de navegação à esquerda.

- Acesse e clique em `Criar load balancer`.

- Selecione `Criar` Application Load Balancer.

- Nomeie o load balancer.

- Em `Esquema` selecione `Voltado para a internet`.

- Em `Tipo de endereço IP` mantenha `IPv4`.

- Na aba `Mapeamento de rede` selecione a rede VPC.

- Selecione as duas subnets públicas criadas anteriormente.

- Como `Grupo de segurança` selecione o grupo criado anteriormente para EC2.

- Em `Listeners e roteamento` mantenha `HTTP`:`80` e selecione o grupo de destino criado anteriormente.

- Clique em `Criar load Balancer`.

### Auto Scaling
- No menu EC2 procure por `Auto Scaling` na barra de navegação à esquerda.

- Acesse e clique em `Criar grupo do Auto Scaling`.

- Nomeie o grupo de Auto Scaling.

- Selecione o modelo de execução criado anteriormente.

- A seguir clique em `Próximo`.

- Selecione a VPC criada anteriormente.

- Selecione as Sub-redes Privadas.

- A seguir clique em `Próximo`.

- Marque a opção `Anexar a um balanceador de carga existente`.

- Marque a opção `Escolha entre seus grupos de destino de balanceador de carga`.

- Selecione o grupo de destino criado anteriormente.

- A seguir clique em `Próximo`.

- Em `Tamanho do grupo` selecione:
    - Capacidade desejada: 2
    - Capacidade mínima: 2
    - Capacidade máxima: 3

- A seguir clique em `Pular para a revisão`.

- Clique em `Criar grupo de auto Scaling`.

### Verificando funcionamento
- No menu EC2 procure por `load Balancer` na barra de navegação à esquerda.

- Selecione o Load Balancer criado anteriormente, copie o `Nome do DNS` e cole no navegador, se as instâncias do EC2 já estão rodando deve ser possível acessar o WordPress.

- Em seguida configure o WordPress.

- A partir daí é possível acessar e configurar o WordPress.

- Cheque a integridade acesse `Grupos de destino`.

- Selecione o Grupo de destino criado anteriormente e verifique se as instâncias estão íntegras.

- Para acessar as instâncias e verificá-las é necessário criar um EndPoint para isso busque por `VPC`.

- No menu esquerdo selecione Endpoints.

- Clique em `Criar endpoint`.

- Nomeie o Endpoint e em seguida selecione em `Categoria de serviço` a categoria `EC2 Instance Connect Endpoint`.

- Em `VPC` selecione a VPC criada anteriormente.

- Como `Grupos de segurança` selecione o grupo criado para EndPoint.

- Em `Subnet` selecione uma das subnets privadas da VPC.

- Clique em `Criar endpoint`.

- Após o EndPoint ter sido criado navegue até a instância que deseja conectar.

- Clique em `Conectar`.

- Em `Conexão de instância do EC2` selecione `Conectar-se usando o endpoint do EC2 Instance Connect` e em `Endpoint do EC2 Instance Connect` selecione o EndPoint criado anteriormente e clique em `Conectar`.

<details>
<summary>Testar o docker</summary>

- Verifique a execução de containers com o comando: 

```
docker ps
```

- Verifique a instalação do docker-compose com o comando:

```
docker-compose -v
```

- Verifique a config file com o comando:

```
docker-compose ls
```

</details>

<details>
<summary>Testar DataBase</summary>

- Acesse o Container em execução através do comando:

```
docker exec -it <ID_DO_CONTAINER_WORDPRESS> /bin/bash
```

- O `<ID_DO_CONTAINER_WORDPRESS>` pode-ser encontrado utilizando o comando:

```
docker ps
```

- Dentro do Container execute o comando abaixo para atualizar o sistema:

```
apt-get update
```

- Após a atualização do sistema é necessário instalar a biblioteca de cliente do mysql:

```
apt-get install default-mysql-client -y
```

- Agora use o comando abaixo para entrar no banco de dados MySQL:

```
mysql -h <ENDPOINT_DO_SEU_RDS> -P 3306 -u admin -p
```

- O `<ENDPOINT_DO_SEU_RDS>` e o mesmo utilizado no Script que pode-ser encontrado em detalhes após a criação do Database.

</details>

<details>
<summary>Verificar o Mount</summary>

- Verifique se o EFS está montado com o comando:

```
df -h
```

- Verifique a persistência do mount, acesse o diretório etc através do comando.

```
cd /etc
```

- leia o arquivo fstab com o comando.

```
cat fstab
```

</details>

<details>
<summary>Verificar o Crontab</summary>

- Verifique o crontab através do comando:

```
crontab -l
```

</details>