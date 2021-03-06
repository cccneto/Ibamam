
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ibamam

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)
<!-- badges: end -->

<img src="./logos/logo.png" width="25%" />

**Read this in other languages**: [English](README.eng.md)

O objetivo deste pacote é disponibilizar a base de multas e autuações
ambientais do Instituto Brasileiro do Meio Ambiente e dos Recursos
Naturais Renováveis (IBAMA).

Os dados foram obtidos no [Portal Brasileiro de Dados
Abertos](https://dados.gov.br/) no repositóio do
[IBAMA](https://dados.gov.br/organization/instituto-brasileiro-do-meio-ambiente-e-dos-recursos-naturais-renovaveis-ibama).

Caso você queira utilizar a base mais atual, sem que seja necessário
instalar o pacote, recomendo que utilize o seguinte código:

# Como instalar?

Este pacote pode ser instalado através do[GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("cccneto/Ibamam")
library(Ibamam)
```

# Como usar?

O pacote `{Ibamam}`possui 7 funções. Abaixo descrevemos as funções e
como você pode utilizá-las.

### Função para `{obter_arquivos_multas_distribuidas}`

Essa função permite que você efetue a raspagem dos dados referentes a
**Quantidade de Multas Ambientais Distribuídas por Bens Tutelados**, por
exemplo: Flora, Fauna, dentre outros. A função disponibiliza todos os AI
lavrados com ou sem julgamento. Sua atualização é diária, com escopo
temporal diário, e tendo escopo geopolítico Nacional.

### Exemplo

``` r
# Realizando o download dos dados
# multas_distribuidas <- obter_arquivos_multas_distribuidas()

# visualizando somente as 100 primeiras linhas
# multas_distribuidas %>% head(100)
```

## Quais dados poderei acessar com a função `{obter_arquivos_multas_distribuidas}`?

  - **dataAuto**: data de emissão do auto de infração.
  - **dataPagamento**: data de pagamento do auto.
  - **municipio**: municipio/cidade.
  - **numAI**: número de identificação do auto de infração.
  - **tipoInfracao**: tipo de infração cometida.
  - **ultimaAtualizacaoRelatorio**: Informa quando foi a última atualiza
    dos dados.
  - **uf**: Unidade federativa
  - **tipoAuto**: tipo de auto define a categoria da ocorrência -
    exemplos: multa, multa diária, advertência.
  - **moeda**: informa qual a moeda no auto.
  - **situacaoDebito**: informa a situação (status) do débito do auto
  - **enquadramentoLegal**: informa qual o dispositivo legal utilizado
    para enquadrar o auto de infração.
  - **nomeRazaoSocial**: identifica o nome da pessoa ou empresa autuado.
  - **cpfCnpj**: informa CPF ou CNPJ do autuado.
  - **valorAuto**: informa a quantia monetária do auto de infração.

### Função para `{obter_arquivos_arrecadacao}`

Essa função permite que você efetue a raspagem dos dados referentes a
**Arrecadação de Multas Ambientais Distribuídas por Bens Tutelados**,
por exemplo: Flora, Fauna, dentre outros. A função disponibiliza todos
os AI lavrados com ou sem julgamento. A base de dados integra
informações sobre volumes de multas ambientais pagas, consolidados por
bens juridicamente tutelados. Sua atualização é diária, com escopo
temporal diário, e tendo escopo geopolítico Nacional.

## Quais dados poderei acessar com a função `{obter_arquivos_arrecadacao}`?

  - **dataAuto**:data de emissão do auto de infração
  - **dataPagamento**: data de pagamento do auto.
  - **municipio**: municipio/cidade.
  - **numAI**: número de identificação do auto de infração.
  - **valorPago**: valor pago até a data da ultima atualização do
    relatório.
  - **tipoInfracao**: tipo de infração cometida.
  - **ultimaAtualizacaoRelatorio**: Informa quando foi a última atualiza
    dos dados.
  - **parcela**: número da parcela
  - **quantidadeParcela**: comprimento do parcelamento.
  - **uf**: Unidade federativa
  - **tipoAuto**: tipo de auto define a categoria da ocorrência -
    exemplos: multa, multa diária, advertência.
  - **moeda**: informa qual a moeda no auto.
  - **statusDebito**: situação do débito.
  - **enquadramentoLegal**:informa qual o dispositivo legal utilizado
    para enquadrar o auto de infração.
  - **nomeRazaoSocial**: identifica o nome da pessoa ou empresa autuada.
  - **cpfCnpj**: informa CPF ou CNPJ do autuado.
  - **valorbaseParcela**: informa o valor das parcelas para pagamento do
    valor do auto.
  - **valorAuto**:informa a quantia monetária do auto de infração.

Depois de realizar o download das duas bases de dados com as funções
`{obter_arquivos_multas_distribuidas}` e `{obter_arquivos_arrecadacao}`,
agora você precisa fazer a limpeza dos dados. Para isso basta acionar a
função conforme abaixo:

### Exemplo

``` r
# Realizando o download dos dados
# multas_arrecadadas <- obter_arquivos_arrecadacao()

# visualizando somente as 100 primeiras linhas de dados
# multas_arrecadadas %>% head(100)
```

### Função para`{limpar_dados}`

Essa função permite que você realize a limpeza dos dados que você
realizou o download com as funções `{obter_arquivos_arrecadacao}`efetue
a raspagem dos dados referentes ao volume da arrecadação do Ibama com
multas ambientais distribuídas por bem tutelado, exemplo: Flora, Fauna,
dentre outros. Os valores das multas estão fixados em lei e aplicadas de
acordo a tipificação da infração cometida dentre outros. A função
disponibiliza todos os AI lavrados com ou sem julgamento.

### Exemplo

``` r
# limpando base "multas_distribuidas"
# multas_arrecadadas_limpo <- limpar_dados(multas_arrecadadas)

# limpando base "multas_distribuidas"
# multas_distribuidas_limpo <- limpar_dados(multas_distribuidas)
```

### Função para`{baixar_id_municipios}`

Com os dados de multas distribuidas e multas arrecadadas você pode
desejar realizar algumas análises que requeiram dados espaciais. Para
isso precisamos antes configurar os dados. O primeiro passo é usar a
função `{baixar_id_municipios}`para pegarmos os códigos da [Tabela de
Códigos de Municípios do
IBGE](https://www.ibge.gov.br/explica/codigos-dos-municipios.php). A
função criará um novo dataframe contendo os codigos municipais, uf, e
os nomes dos municipios brasileiros.

### Exemplo

``` r
# Pegando códigos municipais
# id_codigos <- baixar_id_municipios()
```

### Função para`{juntar_bases}`

Agora precisamos unir as bases do Ibama (*multas\_arrecadadas\_limpo*
**e** *multas\_distribuidas\_limpo*) com os codigos municipais do IBGE
(*id\_codigos*). Para isso aplique a função conforme descrito abaixo:

### Exemplo

``` r
# Juntando *multas_arrecadadas* com os codigos municipais
# multas <- juntar_bases(base_ibama = multas_arrecadadas_limpo, base_ibgecode = id_codigos)

# Juntando *multas_distribuidas* com os códigos municipais
# autuacoes <- juntar_bases(base_ibama = multas_distribuidas_limpo, base_ibgecode = id_codigos)
```

Se você quiser visualizar as bases prontas, basta digitar os codigos
abaixo:

``` r
# multas  %>% head()

# ou 

# autuacoes %>% head()
```

## Como citar o pacote

  - [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)

  - “**CRUZ NETO, Claudiano C., MILZ, Beatriz., MACEDO, Samuel** (2021).
    Ibamam: Pacote para tratamento da Base de dados para multas e
    autuações ambientais aplicadas pelo Instituto Brasileiro do Meio
    Ambiente e dos Recursos Naturais Renováveis - Brasil.
    <https://doi.org/10.5281/zenodo.4509344>”.
