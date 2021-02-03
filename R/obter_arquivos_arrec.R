#' @title Downloading data from Ibama database - Multas
#'
#' @param ufs bla bla bla
#' @param path Path where the jason files will be saved.
#'
#' @return a data frame
#'
#' @export
obter_arquivos_arrec <- function() {
  purrr::map_dfr(
    unique(geobr::grid_state_correspondence_table$code_state),
    raspar_arquivos_arrec
  )

}

raspar_arquivos_arrec <- function(uf){
  arrec <- jsonlite::fromJSON(
      paste0(
        "http://dadosabertos.ibama.gov.br/dados/SICAFI/", uf,
        "/Arrecadacao/arrecadacaobenstutelados.json"
      )
  )

  dplyr::as_tibble(arrec$data)
}
