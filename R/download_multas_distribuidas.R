#' @title Downloading data from Ibama database - Multas Distribuidas
#'
#' @return a data frame
#'
#' @export
download_multas_distribuidas <- function(){
  id_codigos <- Ibamam::ibge_code

  obter_arquivos_multas_distribuidas() %>%
    limpar_dados() %>%
    juntar_bases(base_ibgecode = id_codigos)
}
