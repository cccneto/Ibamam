#' @title Downloading data from Ibama database - Multas Arrecadadas
#'
#' @return a data frame
#'
#' @export
download_multas_arrecadadas <- function(){
  id_codigos <- Ibamam::ibge_code

  get_data_of_brazil(estados = "all", tipo_multa = "arrecadadas")  %>%
    limpar_dados() %>%
    juntar_bases(base_ibgecode = id_codigos)
}
