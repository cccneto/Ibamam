#' @title Downloading data from Ibama database - Multas arrecadadas
#'
#' @param ufs Siglas dos estados brasileiros
#' @param path Path where the jason files will be saved.
#'
#' @return a data frame
#'
#' @export
obter_arquivos_arrecadacao <- function() {
  purrr::map_dfr(
    unique(geobr::grid_state_correspondence_table$code_state),
    raspar_arquivos_arrecadacao
  )

}

raspar_arquivos_arrecadacao <- function(uf){
  multas_arrecadadas <- jsonlite::fromJSON(
      paste0(
        "http://dadosabertos.ibama.gov.br/dados/SICAFI/", uf,
        "/Arrecadacao/arrecadacaobenstutelados.json"
      )
  )

  dplyr::as_tibble(multas_arrecadadas$data)
}
