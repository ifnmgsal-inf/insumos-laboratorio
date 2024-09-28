
# Sistema WEB para Registro do Uso dos Produtos Químicos Fiscalizados pelo Departamento de Polícia Federal no IFNMG Campus Salinas

<p align="center">
    <img src="https://qualitapps.com/wp-content/uploads/2023/02/102.png" width="120" height="80"/>
</p>

Este sistema foi desenvolvido com o objetivo de otimizar o gerenciamento e controle do uso de produtos químicos regulamentados pelo departamento da Polícia Federal no IFNMG - Campus Salinas.

## Execução Rápida e Confiável

Para uma execução mais ágil, recomendo o uso do link: [https://sistema.lab.salinas.ngrok.dev](https://sistema.lab.salinas.ngrok.dev)
O sistema está disponível diariamente das 08:30 às 23:00, proporcionando maior rapidez, sem a necessidade de clonar o github, realizar a instalação do MariaDB, node e Express, e outras dependências, e configurar o ambiente local.

[https://sistema.lab.salinas.ngrok.dev](https://sistema.lab.salinas.ngrok.dev)

## Acesso para Testes

Para fins de teste, foram disponibilizados dois tipos de usuários com diferentes níveis de acesso:

- **Usuário Administrador:**
  - **Email:** admin@sistema.com
  - **Senha:** 12345678

- **Usuário Técnico (acesso limitado):**
  - **Email:** tecnico02@sistema.com
  - **Senha:** 123456


A seguir o tutorial de uso local.

## Pré-requisitos

Certifique-se de que você tem as seguintes ferramentas instaladas:

- Node.js (v14 ou superior)
- MySQL (ou MariaDB)

## Instalando

### Clonar o Repositório

Clone o repositório para a sua máquina local:

```bash
git clone https://github.com/seu-usuario/sistema-inventario.git
cd sistema-inventario
```

### Instalar Dependências

Instale as dependências do projeto com o npm:

```bash
npm install express path dotenv pdfkit fs express-session bcrypt nodemon

```

## Configuração

1. **Configurar Variáveis de Ambiente:**
   Você precisa alterar a linha 11 do arquivo `app.js`, que contém:
   ```javascript
   dotenv.config({ path: 'seucaminho/variaveis.env' });
   ```
   Substitua `'seucaminho/variaveis.env'` pelo caminho correto onde seu arquivo `variaveis.env` está localizado.

2. **Configurar o Banco de Dados:**
   Certifique-se de que o MySQL está instalado e em execução. Crie um banco de dados e configure as tabelas conforme necessário.

```plaintext
PORT=3001
DB_HOST=localhost
DB_PORT=3306
DB_USER=seu_usuario
DB_PASSWORD=sua_senha
DB_NAME=seu_banco_de_dados
SESSION_SECRET=sua_chave_secreta
```
## Instruções para Importação de Dump do Banco de Dados
Salve o 'banco_dados_si_dump.sql' e execute com o MySQL:

```bash
mysql -u <usuario> -p < banco_dados_si_dump.sql
```

Substitua `<usuario>` pelo seu nome de usuário. Assim, você terá a estrutura das tabelas e o usuário admin configurado corretamente.  Teno o scrpt inserido um  de email 'admin@sistema.com', nome 'administrador', do tipo admin e senha '12345678'

## Executando o Sistema

Para iniciar o servidor, execute o seguinte comando:

```bash
nodemon app.js
```

O sistema estará acessível em `http://localhost:3001`.

## Funcionalidades do Sistema

### Para Usuários do Tipo "Admin" e "Normal"

1. **Registro de Consumo:**
   - Permite o registro detalhado do consumo de produtos, incluindo a seleção do produto, quantidade, laboratório, data do consumo e uma descrição adicional.

2. **Visualização e Geração de Relatórios em PDF:**
   - Gera relatórios detalhados em PDF com informações sobre o inventário e os consumos registrados.

3. **Inventário:**
   - Exibe todos os produtos do inventário, incluindo o nome do produto, a quantidade disponível e informações complementares.

### Funcionalidades Exclusivas para Usuários do Tipo "Admin"

1. **Registro de Entrada:**
   - Na página de movimentações, o administrador pode registrar entradas de produtos com os seguintes campos obrigatórios:
     - **Produto:** Seleção do produto.
     - **Quantidade:** Quantidade do produto.
     - **Data de Entrada:** Data em que o produto entrou no inventário.
     - **Descrição:** Informações adicionais sobre a entrada do produto.

2. **Gerenciamento de Produtos:**
   - **Adicionar Produtos:** Permite a inclusão de novos produtos químicos ao inventário, com detalhes como sigla, concentração, densidade, nome completo, tipo de unidade (mililitros ou gramas) e NCM.
   - **Atualizar Produtos:** Atualiza as informações dos produtos já cadastrados.
   - **Remover Produtos:** Exclui produtos do inventário após a confirmação do usuário.

3. **Gerenciamento de Usuários:**
   - **Adicionar Usuários:** Permite a criação de novos usuários, solicitando os seguintes dados:
     - Nome de Usuário.
     - Email.
     - Tipo de Usuário (Normal ou Admin).
     - Senha e confirmação da senha.
   - **Visualizar Usuários:** Exibe uma lista com todos os usuários cadastrados no sistema.
   - **Gerenciar Status de Usuários:** Ativa ou desativa o acesso de usuários. Usuários ativados podem fazer login, enquanto usuários desativados não podem acessar o sistema.

4. **Gerenciamento de Laboratórios:**
   - **Adicionar Laboratório:** Permite a inclusão de novos laboratórios, solicitando o nome do laboratório e o responsável.
   - **Visualizar Laboratórios:** Exibe todos os laboratórios cadastrados no sistema.
   - **Editar Responsável pelo Laboratório:** Atualiza o responsável atribuído a um laboratório.
   - **Remover Laboratório:** Exclui laboratórios do sistema.
