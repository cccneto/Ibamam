#' @title Downloading data from Ibama database - Multas Distribuidas
#'
#' @return a data frame
#'
#' @export
download_multas_distribuidas <- function(){
  id_codigos <- Ibamam::ibge_code

  get_data_of_brazil(estados = "all", tipo_multa = "distribuidas") %>%
    limpar_dados() %>%
    juntar_bases(base_ibgecode = id_codigos)
}
