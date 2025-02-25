# Desafio 

## Cientista de Dados - DIT - SMS


### Requisitos:

 - Python
 - SQL
 - dbt

### Solução do Desafio:

Para resolver o desafio proposto, foi criado um banco de dados utilizando PostgreSQL e o ambiente vitrual com python. A estrutura do projeto no dbt foi organizada em três camadas dentro da pasta models, facilitando a gestão e compreensão do fluxo de dados:

 - Staging:

Objetivo: Selecionar e preparar os dados brutos para as próximas etapas.

Implementação: Foi criado o esquema staging, onde foram selecionados os registros distintos de id_paciente, considerando a data de cadastro mais recente. Essa etapa garante a eliminação de duplicatas e mantém apenas os registros mais atualizados de cada paciente.

Benefícios: Assegura a qualidade dos dados desde o início, facilitando a detecção de inconsistências e preparando-os para transformações futuras.

 - Intermediate:

Objetivo: Realizar transformações nos dados e colunas para padronização e enriquecimento.

Implementação: No esquema intermediate, foram aplicadas diversas transformações:

Limpeza de Dados: Remoção de espaços em branco, caracteres especiais e correção de formatações.

Conversões de Tipos: Colunas de data em formato texto foram convertidas para o tipo DATE ou TIMESTAMP, garantindo a correta manipulação temporal.

Normalização: Padronização de valores categóricos e tratamento de valores nulos ou inconsistentes.

Benefícios: Essa camada intermediária assegura que os dados estejam em um formato consistente e pronto para análises mais aprofundadas, reduzindo a complexidade nas etapas seguintes.

 - Marts:

Objetivo: Disponibilizar os dados finais prontos para análise e consumo por partes interessadas.

Implementação: No esquema marts, foi criado o modelo final com a aplicação de filtros específicos:

Filtro Aplicado: Exclusão de registros onde renda_familiar é igual a 'Manhã' ou 'Internet', conforme as regras de negócio definidas.

Resultado: Geração de uma tabela limpa e focada nos dados relevantes para as análises pretendidas.

Benefícios: Fornece uma visão consolidada e refinada dos dados, pronta para ser utilizada em dashboards, relatórios e outras ferramentas analíticas.

