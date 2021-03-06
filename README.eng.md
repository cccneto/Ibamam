
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ibamam

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)
<!-- badges: end -->

<img src="./logos/logo.png" width="25%" /> **Read this in other
languages: [Portuguese](README.port.md)**

This package aims to provide the basis for environmental fines and
notices from the Brazilian Institute for the Environment and Renewable
Natural Resources (IBAMA).

You can visit the Brazilian Open Data Portal in the IBAMA repository at
[Portal Brasileiro de Dados Abertos](https://dados.gov.br/) no
repositóio do
[IBAMA](https://dados.gov.br/organization/instituto-brasileiro-do-meio-ambiente-e-dos-recursos-naturais-renovaveis-ibama).

If you want to use the most current database without having to install
the package, I recommend that you use the following code:

# How to install?

This package can be installed via \[GitHub\] (<https://github.com/>)
using the following code in `R`:

``` r
# install.packages("devtools")
devtools::install_github("cccneto/Ibamam")
library(Ibamam)
```

# How to use **Ibamam**?

The `{Ibamam}` package has seven functions. Below we describe the tasks
and how you can use them.

### Function to `{obter_arquivos_multas_distribuidas}`

This function allows you to scrape the data related to **Quantity of
Environmental Fines Distributed by Protected Property**, for example,
Flora, Fauna, among others. The function makes available all AI drawn up
with or without judgment. Its update is daily, with a daily temporal
scope and having a National geopolitical content.

### Examples

``` r
# Downloading data
# env_fines_distributed <- obter_arquivos_multas_distribuidas()

# To view only the first 100 lines
# env_fines_distributed %>% head(100)
```

## What data can I access with the function `{obter_arquivos_multas_distribuidas}`?

  - **dataAuto **: date of issue of the tax assessment notice.
  - **dataPagamento **: date of payment of the infraction.
  - **municipio **: municipality / city.
  - **numAI **: identification number of the infraction notice.
  - **tipoInfracao**: type of infraction committed.
  - **ultimaAtualizacaoRelatorio **: Informs when the data was last
    updated.
  - **uf **: state of the federation
  - **tipoAuto**: auto type defines the category of the occurrence -
    examples: fine, daily fine, warning.
  - **moeda**: informs which currency.
  - **situacaoDebito **: monetary status of the infraction.
  - **enquadramentoLegal**: informs which legal device framing the
    infraction notice.
  - **nomeRazaoSocial**: identifies the name of the person or company
    assessed.
  - **cpfCnpj **: informs the CPF or CNPJ of the assessed taxpayer.
  - **valorAuto **: informs the monetary amount of the tax assessment
    notice.

### Function to `{obter_arquivos_arrecadacao}`

This function allows you to scrape data related to **Collection of
Environmental Fines Distributed by Protected Property**, for example,
Flora, Fauna, among others. The function makes available all AI drawn up
with or without judgment. The database includes information on volumes
of paid environmental fines, consolidated by legally protected assets.
Its update is daily, with a daily temporal scope and having a National
geopolitical content.

## What data can I access with the function `{obter_arquivos_arrecadacao}`?

  - **dataAuto **: date of issue of the tax assessment notice.

  - **dataPagamento **: date of payment of the infraction.

  - **municipio **: municipality / city.

  - **numAI**: identification number of the infraction notice.

  - **valorPago**: amount paid up to the date of the last update of the
    report.

  - **tipoInfracao**: type of infraction committed.
    
      - **ultimaAtualizacaoRelatorio **: Informs when the data was last
        updated.

  - **parcela**: installment number

  - **quantidadeParcela**: number of payments in installments.

  - **uf**: state of the federation

  - **tipoAuto**: auto type defines the category of the occurrence -
    examples: fine, daily fine, warning.

  - **moeda**: informs which currency.

  - **situacaoDebito **: monetary status of the infraction.

  - **enquadramentoLegal**: informs which legal device framing the
    infraction notice.

  - **nomeRazaoSocial**: identifies the name of the person or company
    assessed.

  - **cpfCnpj**: informs the CPF or CNPJ of the assessed taxpayer.

  - **valorAuto**: informs the monetary amount of the tax assessment
    notice.

  - **valorbaseParcela**: informs the value of the installments for
    payment of the auto value.

After downloading the two databases with the functions
`{obt_arquivos_multas_distribuidas}` and `{obt_arquivos_arrecadacao}`,
now you need to clean the data. To do so, activate the function as
follows:

### Example

``` r
# Downloading data
# fines_collected <- obter_arquivos_arrecadacao()

# To view only the first 100 lines
# fines_collected %>% head(100)
```

### Function to`{limpar_dados}` - wrangling data\!

This function allows you to wrangling the data that you downloaded with
the functions `{obtain_arquivos_arrecadacao}` scrape the data referring
to the volume of the collection of Ibama with environmental fines
distributed by well guarded, example: Flora, Fauna, among others. The
penalties were fixed by law and applied according to the classification
of the infraction committed, among others. The function makes available
all AI drawn up with or without judgment.

### Examplo

``` r
# wrangling database "fines_collected"
# fines_collected_clear <- limpar_dados(env_fines_distributed)

# limpando base "multas_distribuidas"
# env_fines_distributed_clear <- limpar_dados(env_fines_distributed)
```

### Function to`{baixar_id_municipios}`

With the data from fines distributed and fines collected, you may wish
to carry out some analyses requiring spatial data. For that, we need to
configure the data first. The first step is to use the function
`{baix_id_municipios}` to get the codes from the \[IBGE Municipality
Code Table\]
(<https://www.ibge.gov.br/explica/codigos-dos-municipios.php> ). The
function will create a new data frame containing the municipal id codes,
id state (uf), and Brazilian municipalities’ names.

### Example

``` r
# get municipalities id codes 
# id_codes <- baixar_id_municipios()
```

### Função para`{juntar_bases}`

Agora precisamos unir as bases do Ibama (*multas\_arrecadadas\_limpo*
**e** *multas\_distribuidas\_limpo*) com os codigos municipais do IBGE
(*id\_codes*). Para isso aplique a função conforme descrito abaixo:

### Exemplo

``` r
# Join  *fines_colecteds* com os codigos municipais
# fines <- juntar_bases(base_ibama = fines_collected_clear, base_ibgecode = id_codes)

# Join  *multas_distribuidas* com os códigos municipais
# fines_autos <- juntar_bases(base_ibama = env_fines_distributed_clear, base_ibgecode = id_codes)
```

If you want to see the ready bases, enter the codes below:

``` r
# fines  %>% head()

# ou 

# fines_autos %>% head()
```

## How to quote the package

  - [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)

  - “**CRUZ NETO, Claudiano C., MILZ, Beatriz., MACEDO, Samuel** (2021).
    Ibamam: Pacote para tratamento da Base de dados para multas e
    autuações ambientais aplicadas pelo Instituto Brasileiro do Meio
    Ambiente e dos Recursos Naturais Renováveis - Brasil.
    <https://doi.org/10.5281/zenodo.4509344>”.
