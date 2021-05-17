#' @title Downloading data from Ibama database - Multas Arrecadadas
#'
#' @return a data frame
#'
#' @export
download_multas_arrecadadas <- function(){
  id_codigos <- Ibamam::ibge_code

  get_data_of_brazil(estados = "all", tipo_multa = "arrecadadas")  %>%
    clean_dataset() %>%
    unite_with_ibge_code(base_ibgecode = id_codigos)
}
