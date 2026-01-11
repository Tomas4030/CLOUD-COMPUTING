# 📂 Aplicação Fullstack K8s

Esta é uma aplicação de três camadas (Frontend, Backend e Base de Dados) totalmente conteinerizada e orquestrada via Kubernetes. 
O projeto demonstra o uso de volumes persistentes, segredos, configurações dinâmicas e exposição via Ingress.

## 🏗️ Arquitetura do Projeto

A aplicação segue a estrutura clássica de 3 camadas:

1. **Frontend**: Interface Web (Nginx) acessível via navegador.
2. **Backend**: API (Node.js/Python) que processa a lógica de negócio.
3. **Database**: Base de dados relacional (PostgreSQL) com persistência de dados.

```text
[ Utilizador ] ----> [ Ingress ] ----> [ Service: Frontend ]
                                            |
                                    [ Service: Backend ]
                                            |
                                    [ StatefulSet: DB ] <--- [ PVC/StorageClass ]

```

---

## 🛠️ Tecnologias Utilizadas

* **Minikube**: Cluster local.
* **Kubernetes**: Orquestração de containers.
* **PostgreSQL**: Armazenamento de dados.
* **Ingress Controller**: Gestão de acesso externo.

---

## 🚀 Como Executar

### 1. Pré-requisitos

Certifique-se de ter instalado:

* [Docker](https://docs.docker.com/get-docker/)

### 2. Instalação e Inicialização

Ao executar o script de start, o projeto será totalmente preparado: todas as imagens são construídas, os recursos aplicados no cluster e as portas necessárias expostas automaticamente. No final do processo, o terminal irá mostrar o link para aceder à aplicação. Basta abrir esse link no navegador para começar a usar a interface.

1. **Preparar e iniciar o Ambiente:**
```bash
chmod +x ./scripts/start.sh

```


## 🧪 Testes de Validação

Para verificar se todos os componentes estão saudáveis, execute:

```bash
./scripts/test.sh

```

O script verificará o estado dos Pods, Services e a conectividade da base de dados.

---

## 🧹 Limpeza do Ambiente

Para remover todos os recursos criados e parar o cluster:

```bash
./scripts/cleanup.sh

```

---

## 📂 Estrutura do Repositório

```text
.
├── infra/
│   ├── backend/        # Deployment e Service da API
│   ├── database/       # StatefulSet, PVC e Service do DB
│   ├── frontend/       # Deployment e Service da Interface
│   ├── ingress/        # Configuração do Ingress Controller
│   └── config/         # ConfigMaps e Secrets
├── scripts/            # Scripts de automação (.sh)
└── README.md

```

