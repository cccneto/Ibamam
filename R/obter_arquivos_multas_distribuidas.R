#' @title Downloading data from Ibama database - multas distribuidas
#'
#' @return a data frame
#'
#' @export
obter_arquivos_multas_distribuidas <- function() {
  purrr::map_dfr(
    unique(geobr::grid_state_correspondence_table$code_state),
    raspar_arquivos_multas_distribuidas
  )

}

raspar_arquivos_multas_distribuidas <- function(uf){
  multas_distribuidas <- jsonlite::fromJSON(
    paste0(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/", uf,
      "/Quantidade/multasDistribuidasBensTutelados.json"
    )
  )

  dplyr::as_tibble(multas_distribuidas$data)
}
