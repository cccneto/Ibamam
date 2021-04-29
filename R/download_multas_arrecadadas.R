#' @title Downloading data from Ibama database - Multas Arrecadadas
#'
#' @return a data frame
#'
#' @importFrom dplyr %>%
#' @export
download_multas_arrecadadas <- function(){
  id_codigos <- baixar_id_municipios()

  obter_arquivos_arrecadacao() %>%
    limpar_dados() %>%
    juntar_bases(base_ibgecode = id_codigos)
}
