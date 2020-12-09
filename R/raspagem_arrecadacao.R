#' Baixa os arquivos a tabela json
#'
#' @param path pasta onde salvarei a tabela json
#'
#' @export

library(magrittr)

# Criar uma funcao para ler os arquivos

obter_arquivos_arrec <- function(uf, path) {

  `%>%` <- magrittr::`%>%`  #  carregando apenas a funcao do pacote

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


df_arrecadacao_arrumar <- df_arrecadacao$data %>% tibble::as_tibble()

# salvando em csv
write.csv(df_arrecadacao_arrumar, file = "df_arrecadacao_arrumar.csv",
          sep = ",", fileEncoding = "Latin1")

# Salvando df para criar arquivo para depois salvar em rda.
da_arrec_ibama <- read.csv("df_arrecadacao_arrumar.csv")

# salvar nos dados do pacote
# usethis::use_data(da_arrec_ibama, overwrite = TRUE)


glimpse(df_arrecadacao_arrumar)

library(tidyverse)

df4 <- df2 %>%
  select(dataAuto, dataPagamento) %>%
 mutate(dataAuto1 = lubridate::dmy(dataAuto)) %>%
  View()

