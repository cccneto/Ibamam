
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ibamam <img src="man/figures/hexlogo.png" align="right" width = "120px"/>

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)
[![R-ubuntu](https://github.com/cccneto/Ibamam/actions/workflows/R-CMD-check-ubuntu.yaml/badge.svg)](https://github.com/cccneto/Ibamam/actions/workflows/R-CMD-check-ubuntu.yaml)
<!-- badges: end -->

This package aims to provide the dataset for environmental fines and
notices from the Brazilian Institute for the Environment and Renewable
Natural Resources (IBAMA).

You can visit the [IBAMA
repository](https://dados.gov.br/organization/instituto-brasileiro-do-meio-ambiente-e-dos-recursos-naturais-renovaveis-ibama)
in the [Brazilian Open Data Portal](https://dados.gov.br/).

## How to install?

This package can be installed via [GitHub](https://github.com/) using
the following code in `R`:

``` r
# install.packages("remotes")
remotes::install_github("cccneto/Ibamam")
```

## How to use **Ibamam**?

The `{Ibamam}` package has one function available:
`get_dataset_ibamam()`. This function returns a tibble, containing
several columns [described in the documentation of the
function](https://cccneto.github.io/Ibamam/reference/get_dataset_ibamam.html#value).
This function has three arguments: `dataset` , `uf` and `clean`.

-   `dataset` can receive one of the two values: `distribuidas` or
    `arrecadadas`. Use `distribuidas` to get data of the environmental
    fines applied by Ibama. Use `arrecadadas` to get data of the
    environmental fines collected by Ibama (which means that the fine
    has been paid).

-   `uf` is the abreviation of the name of the states (two letters in
    lower case) that data will be obtained. The default value is
    `"all"`, so all data from all the states of Brazil will be returned
    by default. Please notice that, If you use the default value, it
    might take several minutes to execute.

-   `clean` is whether the dataset should be cleaned or not. If `TRUE`,
    the dataset will be cleaned. If `FALSE`, the returned dataset will
    be the original version, without modifications. Default is `TRUE`.

Examples on how to use this function:

``` r
library(Ibamam)

# get fines applied by IBAMA in Pará
fines_applied_Para <- get_dataset_ibamam(dataset = "distribuidas", uf = "PA")

dplyr::glimpse(fines_applied_Para)
#> Rows: 59,703
#> Columns: 16
#> $ dataAuto                   <date> 2021-04-23, 2020-09-28, 2021-02-10, 2020-0…
#> $ nomeMunicipio              <chr> "PLACAS", "RUROPOLIS", "MARAPANIM", "PRAINH…
#> $ nomeMunicipio_geobr        <chr> "Placas", "Rurópolis", "Marapanim", "Prainh…
#> $ codigoMunicipio            <chr> "1505650", "1506195", "1504406", "1506005",…
#> $ numAI                      <chr> "ABYX5X27 - ", "AB1FQ5MJ - ", "AD6DF079 - "…
#> $ tipoInfracao               <fct> Outras, Flora, Unidades de conservação, Flo…
#> $ ultimaAtualizacaoRelatorio <dttm> 2021-05-29 19:15:00, 2021-05-29 19:15:00, …
#> $ uf                         <chr> "PA", "PA", "PA", "PA", "PA", "PA", "PA", "…
#> $ situacaoDebito             <chr> "Para homologação/prazo de defesa", "Para h…
#> $ tipoAuto                   <fct> Multa, Multa, Multa, Multa, Multa, Multa, M…
#> $ moeda                      <fct> Real, Real, Real, Real, Real, Real, Real, R…
#> $ enquadramentoLegal         <fct> "Decreto 6514/2008 - Artigo 79", "Decreto 6…
#> $ nomeRazaoSocial            <chr> "ILSON ALVES DE FARIA", "ABIDIEL CELESTINO …
#> $ cpfCnpj                    <chr> "651.179.132-72", "516.819.352-87", "667.55…
#> $ valorAuto                  <dbl> 10000.0, 8000.0, 2000.0, 180729.9, 2015000.…
#> $ enquadramentoJuridico      <fct> CPF, CPF, CPF, CNPJ, CPF, CPF, CPF, CNPJ, C…

# get fines collected by IBAMA in Pará
fines_collected_Para <- get_dataset_ibamam(dataset = "arrecadadas", uf = "PA")

dplyr::glimpse(fines_collected_Para)
#> Rows: 73,686
#> Columns: 21
#> $ dataAuto                   <date> 2019-12-01, 2020-03-20, 2020-03-10, 2020-0…
#> $ nomeMunicipio              <chr> "PACAJA", "ANANINDEUA", "ANANINDEUA", "ANAN…
#> $ nomeMunicipio_geobr        <chr> "Pacajá", "Ananindeua", "Ananindeua", "Anan…
#> $ codigoMunicipio            <chr> "1505486", "1500800", "1500800", "1500800",…
#> $ dataPagamento              <date> 2020-12-16, 2021-02-17, 2021-02-22, 2021-0…
#> $ valorPago                  <dbl> 8400.32, 863.86, 866.96, 863.86, 863.86, 10…
#> $ numAI                      <chr> "C7AZB2I8 - ", "DB3W3QKR - ", "GUN4XIPO - "…
#> $ tipoInfracao               <fct> Flora, Outras, Outras, Outras, Outras, Flor…
#> $ ultimaAtualizacaoRelatorio <dttm> 2021-05-29 19:26:00, 2021-05-29 19:26:00, …
#> $ parcela                    <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3…
#> $ quantidadeParcela          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 30, 30,…
#> $ uf                         <chr> "PA", "PA", "PA", "PA", "PA", "PA", "PA", "…
#> $ tipoAuto                   <fct> Multa, Multa, Multa, Multa, Multa, Multa, M…
#> $ moeda                      <fct> Real, Real, Real, Real, Real, Real, Real, R…
#> $ statusDebito               <chr> "Quitado. Baixa automática", "Quitado. Baix…
#> $ enquadramentoLegal         <fct> "Decreto 6514/2008 - Artigo 47", "Decreto 6…
#> $ nomeRazaoSocial            <chr> "SIMONE SOUZA MORAES", "JATEX TRANSPORTES L…
#> $ cpfCnpj                    <chr> "019.077.525-44", "39.124.797/0004-17", "43…
#> $ valorbaseParcela           <dbl> 11524.50, 1200.00, 1200.00, 1200.00, 1200.0…
#> $ valorAuto                  <dbl> 11524.5, 1200.0, 1200.0, 1200.0, 1200.0, 15…
#> $ enquadramentoJuridico      <fct> CPF, CNPJ, CNPJ, CNPJ, CNPJ, CPF, CNPJ, CNP…
```

If you want to get the data for the whole country (Brazil), do not write
anything in the argument uf.

``` r
# get fines applied by IBAMA in Brazil
fines_applied_Brasil <- get_dataset_ibamam(dataset = "distribuidas")

# get fines collected by IBAMA in Brazil
fines_collected_Brasil <- get_dataset_ibamam(dataset = "arrecadadas")
```

If you want to get the data for more than one state, but not for the
whole country, use a vector in the argument uf with the abbreviations of
the name of the states.

``` r
# get fines applied by IBAMA in Southeast of Brazil
fines_applied_southeast <- get_dataset_ibamam(dataset = "distribuidas", uf = c("SP", "RJ", "ES", "MG"))

# get fines collected by IBAMA in Southeast of Brazil
fines_collected_southeast <- get_dataset_ibamam(dataset = "arrecadadas", uf = c("SP", "RJ", "ES", "MG"))
```

If you want to access the original data, without the cleaning steps, use
the argument `clean = FALSE`. Example:

``` r
# get fines applied by IBAMA in São Paulo, without cleaning the dataset
untidy_fines_applied_SP <- get_dataset_ibamam(dataset = "distribuidas", uf = "SP", clean = FALSE)

dplyr::glimpse(untidy_fines_applied_SP)
#> Rows: 34,598
#> Columns: 13
#> $ dataAuto                   <chr> "22/04/2020", "17/10/2019", "27/01/2020", "…
#> $ municipio                  <chr> "SAO JOSE DO RIO PRETO", "MARILIA", "SAO JO…
#> $ numAI                      <chr> "AC6FODNB - ", "ADX7F7IM - ", "AEGEYX7V - "…
#> $ tipoInfracao               <chr> "Fauna", "Fauna", "Fauna", "Controle ambien…
#> $ ultimaAtualizacaoRelatorio <chr> "29/05/2021 19:23", "29/05/2021 19:23", "29…
#> $ uf                         <chr> "SP", "SP", "SP", "SP", "SP", "SP", "SP", "…
#> $ situacaoDebito             <chr> "Quitado. Baixa automática", "Cancelado", "…
#> $ tipoAuto                   <chr> "Multa", "Multa", "Multa", "Multa", "Multa"…
#> $ moeda                      <chr> "Real", "Real", "Real", "Real", "Real", "Re…
#> $ enquadramentoLegal         <chr> "Decreto 6514/2008 - Artigo 3º, Instrução N…
#> $ nomeRazaoSocial            <chr> "JOSE ELIEZER DO PRADO DOS SANTOS", "VALTER…
#> $ cpfCnpj                    <chr> "368.573.748-13", "063.360.978-11", "102.74…
#> $ valorAuto                  <dbl> 500, 500, 500, 45000, 1300, 1300, 400500, 5…
```

<!-- Add cleaning steps here -->

## Data cleaning

By default, the function `get_dataset_ibamam()` will use `clean = TRUE`
and perform the following cleaning steps:

-   Colunms `dataAuto`, `ultimaAtualizacaoRelatorio`, `dataPagamento`
    are transformed from class `character` to class `date`.

-   Colunms `tipoInfracao`, `tipoAuto`, `moeda`, `enquadramentoLegal`
    are transformed from class `character` to class `factor`.

-   Column `enquadramentoJuridico` is created from the `cpfCnpj`: if
    `cpfCnpj` has 14 characteres or less, is “CPF”, else is “CNPJ”.

-   Column `municipio` is mutated into `nomeMunicipio`, and several
    cleanings is made in order to be possible to join with the names of
    municipalities in the package `geobr`.

-   Join the dataset with the result of the package `geobr`, so the
    cleaned dataset has a column with the IBGE code of the municipality,
    called `codigoMunicipio`.

If you want to access the original data (without the cleaning steps),
use the argument `clean = FALSE`.

## How to cite Ibamam Package

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4509344.svg)](https://doi.org/10.5281/zenodo.4509344)
“**CRUZ NETO, Claudiano C., MILZ, Beatriz, MACEDO, Samuel** (2021).
Ibamam: Pacote para tratamento da Base de dados para multas e autuações
ambientais aplicadas pelo Instituto Brasileiro do Meio Ambiente e dos
Recursos Naturais Renováveis - Brasil.
<https://doi.org/10.5281/zenodo.4509344>”.
