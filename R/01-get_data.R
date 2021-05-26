#' @title Downloading data from Ibama database - Multas arrecadadas
#'
#' @return A tibble
#'
#' @keywords internal
get_data_of_brazil <- function(estados = "all", tipo_multa) {
  if (estados[1] == "all") {
    estados_abrev <- Ibamam::uf_abrev
  } else {
    estados_abrev <- estados
  }


  purrr::map2_dfr(
    .x = estados_abrev,
    .y = tipo_multa,
    .f = get_data_of_state
  )
}


#' Obter dados de arrecadacao para um estado
#'
#' @param uf Abreviation of the name of the state (two letters in lower case)
#' @param tipo_multa Which dataset to search for. Can receive one of the values:
#' 'arrecadadas' or 'distribuidas'
#'
#' @return A tibble
#'
#' @keywords internal
get_data_of_state <- function(uf, tipo_multa) {
  if (tipo_multa == "arrecadadas") {
    texto_link <- "Arrecadacao/arrecadacaobenstutelados"
  } else if (tipo_multa == "distribuidas") {
    texto_link <- "Quantidade/multasDistribuidasBensTutelados"
  } else {
    stop("The argument 'tipo_multa' can receive one of the values:
         'arrecadadas' or 'distribuidas'")
  }

  dataset <- jsonlite::fromJSON(
    paste0(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/",
      uf,
      "/",
      texto_link,
      ".json"
    )
  )

  dplyr::as_tibble(dataset$data)
}
