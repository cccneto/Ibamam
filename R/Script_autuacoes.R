#' @title Downloading data from Ibama database - Autuacoes
#'
#' @param path Path where the jason files will be saved.
#'
#' @importFrom dplyr %>%
#'
#' @export

# Criar uma funcao para ler os arquivos
library(dplyr)
library(methods)

obter_arquivos_multas <- function(uf, path) {

    uf_links <-
    glue::glue(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/{uf}/Quantidade/multasDistribuidasBensTutelados.json"
    )

  if (!dir.exists(path)) {
    dir.create(path)
  }

  arquivo <- glue::glue("{path}{uf}.json")   # o argumento path eh para dizer onde salvar

  response <-
    httr::GET(uf_links, httr::write_disk(path = arquivo, overwrite = TRUE))

  print(glue::glue("Download realizado: {arquivo}"))

  content <- httr::content(response, "text") %>%
    jsonlite::fromJSON() %>%
    tibble::as_tibble()

  content
}

# Fazer um vetor com todas as siglas de UF
ufs <- unique(geobr::grid_state_correspondence_table$code_state)

# Usando a fun??o purrr, aplicar a fun??o criada (obter_arquivos_multas()) em todas as UFs
df_multas <- purrr::map_dfr(ufs, obter_arquivos_multas, path = "out.multa/")

# convertendo para tibble
df_multas <- df_multas$data %>% tibble::as_tibble()


#################################################
### Wrangling data ####

library(tidyverse)
library(stringr)
library(lubridate)
library(methods)

# AJustando e limpando base

df_multa_limpo <- df_multas %>%
  dplyr::mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  dplyr::mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  dplyr::mutate(uf = uf) %>%
  dplyr::mutate(tipoAuto = as.factor(tipoAuto)) %>%
  dplyr::mutate(moeda = as.factor(moeda)) %>%
  dplyr::mutate(situacaoDebito = as.factor(situacaoDebito)) %>%
  dplyr::mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  dplyr::mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  dplyr::mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ"))) %>%
  dplyr::mutate(
    municipio = stringr::str_to_lower(municipio), # ajustando letras para maiuscula
    municipio = abjutils::rm_accent(municipio), # retirando acentos
    municipio = stringr::str_replace_all(municipio, "-", " "),
    municipio = dplyr::case_when(
      municipio == "ponte alta do norte" ~ "ponte alta do tocantins",
      TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    uf = dplyr::case_when(
      municipio == "ponte alta do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  dplyr::mutate(
    municipio = dplyr::case_when(
      municipio == "presidente castelo branco" & uf == "SC" ~
        "presidente castello branco", TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    municipio = dplyr::case_when(
      municipio == "colinas de goiais" ~ "colinas do tocantins",
      TRUE ~ municipio)
  ) %>%
  dplyr::mutate(
    uf = dplyr::case_when(
      municipio == "colinas do tocantins" ~ "TO",
      TRUE ~ uf)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "governador edson lobao" ~ "governador edison lobao",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "campo de santana" ~ "tacima",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao domingos de pombal" ~ "sao domingos",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "lagoa do itaenga" ~ "lagoa de itaenga",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "belem de sao francisco" ~ "belem do sao francisco",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "parati" ~ "paraty",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "trajano de morais" ~ "trajano de moraes",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "assu" ~ "acu",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "santana do livramento" ~ "sant'ana do livramento",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao luiz do anuaa" ~ "sao luiz",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "picarras" ~ "balneario picarras",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "passos de torres" ~ "passo de torres",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "couto de magalhaes" ~ "couto magalhaes",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "pau d arco" ~ "pau d'arco",
    TRUE ~ municipio)
  ) %>%
  dplyr::mutate( municipio = dplyr::case_when(
    municipio == "sao valerio da natividade" ~ "sao valerio",
    TRUE ~ municipio)
  )

##############################################################
### Merging data with geographical informations by geoBR ####

# Baixando base do ibge para obtencao dos codigos municipais

library(dplyr)
library(methods)

# Baixando base do ibge para obtencao dos codigos municipais

ibgecode <-
  geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
  dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
  dplyr::mutate(
    name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni), # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " "),
  )

# Fazendo Leftjoin das bases considerando nome de cidades e uf's.

autuacoes <-
  dplyr::left_join(df_multa_limpo, ibgecode,
                   by = c("municipio" = "name_muni", "uf" = "abrev_state"))

# salvando csv para realizar testes
autuacoes_teste <- autuacoes %>% head(1000)

# salvando em formato csv
write.csv(autuacoes_teste, "data/autuacoes_teste.csv")
# write_csv(autuacoes, "data/autuacoes.csv")



usethis::use_data(autuacoes_teste, overwrite = TRUE, compress = "xz")

#' @title Multas Ambientais Distribuidas por Bens tutelados - Autuacoes.
#'
#' @format Uma tibble
#' \describe{
#' \item{dataAuto}{}
#' \item{dataPagamento}{}
#' \item{municipio}{}
#' \item{numAI}{}
#' \item{tipoInfracao}{}
#' \item{ultimaAtualizacaoRelatorio}{}
#' \item{uf}{}
#' \item{tipoAuto}{}
#' \item{moeda}{}
#' \item{situacaoDebito}{}
#' \item{enquadramentoLegal}{}
#' \item{nomeRazaoSocial}{}
#' \item{cpfCnpj}{}
#' \item{valorAuto}{}
#' \item{enquadramentoJuridico}{}
#' \item{code_muni}{}
#' }
#' @name autuacoes
#' @source IBAMA - \url{https://dados.gov.br/dataset/arrecadacao-de-multas-ambientais-bens-tutelados/resource/01e0e66d-0125-4997-b2b6-cbf29bb39302}
"autuacoes"
#' @rdname autuacoes



