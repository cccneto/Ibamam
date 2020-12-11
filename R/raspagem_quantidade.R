#' Baixa os arquivos a tabela json
#'
#' @param path pasta onde salvarei a tabela json
#'
#' @export

# Criar uma funcao para ler os arquivos

obter_arquivos_multas <- function(uf, path) {

  `%>%` <- magrittr::`%>%`  #  carregando apenas a funcao do pacote

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


library(magrittr)
library(tidyverse)

# convertendo para tibble
df_multas_arrumar <- df_multas$data %>% tibble::as_tibble()

glimpse(df_multas_arrumar)

# ajustando variaveis de Data para o formato correto


df_multa <- df_multas_arrumar %>%
  mutate(dataAuto = lubridate::dmy(dataAuto)) %>%
  mutate(tipoInfracao = as.factor(tipoInfracao)) %>%
  mutate(uf = as.factor(uf)) %>%
  mutate(tipoAuto = as.factor(tipoAuto)) %>%
  mutate(moeda = as.factor(moeda)) %>%
  mutate(situacaoDebito = as.factor(situacaoDebito)) %>%
  mutate(enquadramentoLegal = as.factor(enquadramentoLegal)) %>%
  mutate(across(where(is.character), str_remove_all, pattern = fixed("  "))) %>%
  mutate(enquadramentoJuridico = as.factor(if_else(nchar(cpfCnpj) <= 14,"CPF","CNPJ")))


df_multa %>% glimpse()


## salvando em csv
# write.csv(df_multa, file = "df_multa.csv",
# sep = ",", fileEncoding = "Latin1")
