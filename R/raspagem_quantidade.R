#' @title Downloading data from Ibama database
#'
#' @param path Path where the jason files will be saved.
#'
#' @importFrom dplyr %>%
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

# convertendo para tibble
df_multas <- df_multas$data %>% tibble::as_tibble()

# Salvando dataframe, jogando na pasta Ibamam
save(df_multas, file = "df_multas.rda")
