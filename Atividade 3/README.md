# :cloud: Projeto-final-do-PB
AWS - Cloud Pratictioner - PB Aws - IF Fluminense - IFMT - UTFPR - UNAMA  | Programa de Bolsas - DevSecOps

#### Grupo 1:
- [Bruno Garcia Nazareth](https://github.com/brunoshure)
- [Nicolas Meirelles Grisostolo](https://github.com/zSalocin)
- [Raphael Antunes Marinho de Souza](https://github.com/RaphaelAntunesMarinhoDeSouza)

### CASE:
Nós somos da empresa "Fast Engineering S/A" e gostaríamos de uma solução dos senhores(as), que fazem parte da empresa terceira "TI SOLUÇÕES INCRÍVEIS". Nosso eCommerce está crescendo e a solução atual não está atendendo mais a alta demanda de acessos e compras que estamos tendo. Desde o Início do ano os acessos e compras estão crescendo 20% a cada mês.

**Atualmente usamos:**
* 01 servidor para Banco de Dados Mysql;
* 01 servidor para a aplicação utilizando REACT;
* 01 servidor de web Server e que armazena estáticos como fotos e links.

**Nosso pedido é um ORÇAMENTO com:**
- ESCOPO;
- ARQUITETURA DA NOVA SOLUÇÃO;
- VALORES;
- PRAZO DE ENTREGA;
- CRONOGRAMA MACRO DE ENTREGAS;

Sobre a construção da arquitetura para o futuro website da nossa empresa, precisamos seguir as melhores práticas DevOps.

**O que é requerido na atividade:**
- Ambiente Kubernetes;
- Banco de dados PaaS;
- MultiAZ;
- Segurança de backup de dados;
- Persistência dos dados;
- Balanceamento de carga com healthcheck;
- Segurança (liberar somente o necessário/mínimo acesso possível).
  
Objetivo: Monte a proposta e a arquitetura do que o grupo propõe entregar.

___

## Projeto de Migração para a AWS - Fast Engineering S/A

## Introdução

Este repositório contém a documentação e o escopo do projeto de migração para a AWS de um e-commerce. O projeto tem como objetivo aumentar a escalabilidade e reduzir custos operacionais.

## Motivação do Cliente

A motivação por trás desta migração é a necessidade de atender à crescente demanda de acessos e compras que a Fast Engineering S/A está enfrentando.

## Escopo do Projeto

### O escopo do projeto inclui as seguintes etapas:

### 1. ![Emoji-onpremise](https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/logoon.png) Avaliação da Infraestrutura Atual:

 <div align="center">
  <img src="https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/Expedia%20Global%20Deals%20Engine%20Architecture.jpg" width="250px">
   <p><em>Arquitetura Atual</em></p>
</div>

### 2. ![Emoji-AWS](https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/awslogo.png) Arquitetura da Solução Proposta:

A arquitetura proposta segue as melhores práticas e está de acordo com os pilares da AWS Well-Architected Framework.
    
  **2.1. ![Emoji-pilar](https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/new.png) Pilares da AWS Well-Architected Framework**
      
  <div align="center">
    <img src="https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/5697.1673071669.svg" width="450px">
  </div>
  
  **2.2. Migração de Dados:**
  
A equipe está implementando uma migração de banco de dados crucial para o AWS RDS, adotando uma abordagem que prioriza a eficiência e a continuidade operacional. O AWS Database Migration Service (DMS) será utilizado para assegurar uma transição suave, replicando os dados de forma contínua e mantendo sua integridade. Essa estratégia tem como objetivo minimizar qualquer impacto nas operações diárias, ao mesmo tempo em que se aproveita os benefícios da escalabilidade e segurança oferecidos pela AWS. A equipe está comprometida em garantir que essa migração se concretize como uma transição tranquila e bem-sucedida.
  
  **2.3. Serviços Utilizados**
  
- **Amazon CloudFront:**
  - Amazon CloudFront é um serviço de entrega de conteúdo que garante a distribuição eficiente e rápida de conteúdo estático, como imagens e arquivos.
  - Oferece distribuição global eficiente e veloz de conteúdo estático, atendendo à demanda em constante crescimento.
  
- **AWS Web Application Firewall (WAF):**
  - AWS Web Application Firewall é um serviço de firewall projetado para proteger aplicações web contra ataques comuns.
  - Proporciona proteção avançada contra ameaças, garantindo a segurança de aplicativos da web.

- **AWS Shield:**
  - AWS Shield é um serviço de segurança que protege aplicativos e recursos da AWS contra ataques DDoS (Distributed Denial of Service).
  - Fornece defesa contra ataques DDoS de alto nível para manter a disponibilidade dos recursos.

- **Amazon Route 53:**
  - Amazon Route 53 é um serviço DNS que permite registrar e gerenciar domínios, com roteamento de tráfego para recursos AWS, como ELB e CloudFront.
  - Facilita o roteamento de tráfego eficiente e garante alta disponibilidade, direcionando acessos para instâncias e serviços AWS.

- **Amazon Simple Storage Service (S3):**
  - Amazon S3 utiliza Buckets para armazenar e distribuir conteúdo estático, incluindo imagens, vídeos e arquivos, integrando-se ao CloudFront para uma entrega eficiente.
  - Oferece armazenamento seguro e escalável para imagens, vídeos e arquivos.

- **Amazon EKS:**
  - Elastic Kubernetes Service atua como a base da arquitetura, oferecendo orquestração de contêineres por meio do Kubernetes.
  - Proporciona orquestração de contêineres escalável, permitindo a expansão dinâmica e alta disponibilidade da aplicação.

- **Amazon Virtual Private Cloud (VPC):**
  - Virtual Private Cloud isola a infraestrutura na nuvem e fornece controle granular sobre a rede, criando uma rede privada virtual.
  - Cria uma rede VPC, melhorando o controle de tráfego e a segurança da infraestrutura.

- **Amazon RDS for MySQL:**
  - Amazon RDS (Relational Database Service) for MySQL é um serviço gerenciado que facilita a configuração, operação e dimensionamento de um banco de dados MySQL na AWS.
  - Oferece alta disponibilidade, segurança e facilidade de gerenciamento para aplicativos que utilizam o MySQL como banco de dados.

- **Elastic Load Balancing:**
  - Elastic Load Balancing é um serviço que distribui o tráfego entre várias instâncias ou recursos para garantir a alta disponibilidade e a escalabilidade de aplicativos.

- **Amazon CloudWatch:**
  - Amazon CloudWatch é um serviço de monitoramento e observação que fornece insights sobre o desempenho dos recursos e aplicativos AWS.

- **AWS Database Migration Service:**
  - AWS Database Migration Service facilita a migração de bancos de dados para a AWS com segurança e facilidade.

- **Amazon Cognito:**
  - Amazon Cognito é um serviço de autenticação e autorização que permite que você adicione facilmente autenticação para aplicativos da web e móveis.

- **AWS Lambda:**
  - AWS Lambda é um serviço de computação serverless que permite que você execute código sem provisionar ou gerenciar servidores.

- **AWS CloudTrail:**
  - AWS CloudTrail é um serviço que registra atividades na sua conta da AWS, permitindo auditoria e rastreamento de ações.

- **AWS CodeBuild:**
  - AWS CodeBuild é um serviço de compilação totalmente gerenciado que compila código fonte, executa testes e cria artefatos.

- **AWS CodePipeline:**
  - AWS CodePipeline é um serviço de entrega contínua que automatiza a construção, teste e implantação de aplicativos.

- **AWS CodeDeploy:**
  - AWS CodeDeploy é um serviço de implantação automatizada que facilita a implantação de aplicativos na AWS.

- **Amazon EC2:**
  - Amazon EC2 fornece instâncias virtuais sob demanda com configuração personalizável para uma ampla variedade de cargas de trabalho.
  - Escalabilidade sob demanda, permitindo a adaptação rápida às necessidades de computação, sem investimentos antecipados em hardware físico.

- **AWS Backup:**
  - AWS Backup é um serviço de backup totalmente gerenciado que ajuda a simplificar a proteção de dados e a recuperação de recursos da AWS.

- **Cost Usage e Report:**
  - O serviço de Cost Usage e Report da AWS permite rastrear e analisar o uso e os custos dos recursos da AWS.

- **Cost Explorer:**
  - O Cost Explorer é uma ferramenta de análise de custos que ajuda a visualizar e entender seus gastos na AWS.

- **CloudFormation:**
  - AWS CloudFormation é um serviço que permite criar e gerenciar recursos da AWS por meio de modelos de infraestrutura como código.   
 
  **2.4. Nova Arquitetura**
  
<div align="center">
  <img src="https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/Untitled.jpg" width="900px">
</div>

### 3. Valores

[Estimativa de Custo da Nova Arquitetura](https://calculator.aws/#/estimate?id=f0691a4bdf6209114ce6b6391e274d6b089bec07)

<div align="center">
  <img src="https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/Captura%20de%20ecr%C3%A3%20de%202023-10-05%2014-26-18.png" width="500px">
</div>

**Custos**

|             Item                   |                     Descrição                      |       Preço      |
|------------------------------------|----------------------------------------------------|----------------  |
| Migração Para a AWS                | Migração de dados on-premise para a AWS            | $496,40          |
| Infraestrutura da AWS              | Custo da Infraestrutura de serviços da AWS         | $5.373,72/Mensal |
| Custo da Equipe                    | Suporte e manutenção técnica                       | $3.457,76/Mensal |



### 4. Prazo de Entrega:
+ Implementação da arquitetura: **28 dias úteis**.

• Equipe de 3 pessoas:
  - Trabalhando 8 horas por dia
  - Ao longo de 28 dias úteis
  - Total de 672 horas para a entrega

### 5. Cronograma Macro de Entregas:
<div align="center">
  <img src="https://github.com/RaphaelAntunesMarinhoDeSouza/Images/blob/main/Projeto%20Final/Captura%20de%20ecr%C3%A3%20de%202023-10-05%2016-04-54.png" width="800px">
</div>
