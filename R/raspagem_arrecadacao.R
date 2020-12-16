#' Baixa os arquivos a tabela json
#'
#' @param path pasta onde salvarei a tabela json
#'
#' @importFrom dplyr %>%
#'
#' @export
library(magrittr)

# Criar uma funcao para ler os arquivos

obter_arquivos_arrec <- function(uf, path) {

    uf_links <-
    glue::glue(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/{uf}/Arrecadacao/arrecadacaobenstutelados.json"
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

# Usando a funcao purrr, aplicar a funcao criada (obter_arquivos_arrec()) em todas as UFs
df_arrecadacao <- purrr::map_dfr(ufs, obter_arquivos_arrec, path = "out.arrec/")

# convertendo dados para tibble
df_arrecadacao_2 <- df_arrecadacao$data %>% tibble::as_tibble()


# ajustando variaveis de Data para o formato correto
library(tidyverse)
df_arrec <- df_arrecadacao_2 %>%
  mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  mutate(dataPagamento = lubridate::dmy(dataPagamento)) %>%
  mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  mutate(uf = as.factor(uf)) %>%
  mutate(tipoAuto = as.factor(tipoAuto)) %>%
  mutate(moeda = as.factor(moeda)) %>%
  mutate(statusDebito = as.factor(statusDebito)) %>%
  mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ")))


df_arrec %>% glimpse()

## salvando em csv
# write.csv(df_arrec, file = "df_arrec.csv",
# sep = ",", fileEncoding = "Latin1")
