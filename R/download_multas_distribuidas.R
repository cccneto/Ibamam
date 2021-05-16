#' @title Downloading data from Ibama database - Multas Distribuidas
#'
#' @return a data frame
#'
#' @export
download_multas_distribuidas <- function(){
  id_codigos <- Ibamam::ibge_code

  Ibamam::obter_multas_distribuidas_brasil() %>%
    Ibamam::limpar_dados() %>%
    Ibamam::juntar_bases(base_ibgecode = id_codigos)
}
