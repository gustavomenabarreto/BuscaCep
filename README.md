# BuscaCep

**Estrutura do Componente**

**MVC**
   Controller e Model: Usadas como Entidade.
   
**Repository**
   Aplicação: Consumir a API do Viacep.
   
**Services**
  Responsável: Regras de negócios, antes de devolver uma resposta para o controller.
  
**Modules**
  Rotinas Extras: Gerar Log.
  
**Observação:** Estes padrões (Repository e Services) ajudam a desacoplar a lógica da camada Model da aplicação. Com a aplicação do Repository e Services, a Model passa a ser um DTO apenas.

**Estrutura da Aplicação**

**MVC**

**View**: Camada visual.

**Controller**: Intermediário entre view e model.

**Model**: Usada para aplicar regras de negócio.

**DAO**: Responsável por configuração e acesso ao banco.

**Como Utilizar**

  **Instalação do Componente:**
  
    Ir em Tool > Option > Library Path e adicionar as pastas dos fontes do componente (Controller, Services, Module, Model, Repository).
  
  **Configuração do Programa:**
  
    Ir na DAO.
    Abrir o componente de conexão (FdConn) e configurar o caminho do banco para a pasta DB, arquivo db.db.

**Funcionalidades da Aplicação**

  **Pesquisa de Endereços:**
    Pesquisa por CEP ou Endereço, no formato JSON ou XML.
    Busca realizada primeiro no histórico. Caso não haja no histórico, buscará na API e salvará no histórico e no banco de dados.
    Se o endereço já existir, perguntará se deseja atualizar.

  **Desempenho:**
  Toda manipulação ocorre em memória para maior performance, utilizando Listas e CDS.
  A persistência no banco ocorre uma vez ao fechar a aplicação.
