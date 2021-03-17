#' @title Downloading data from Ibama database - Multas Distribuidas
#'
#' @return a data frame
#'
#' @export
download_multas_distribuidas <- function(){
  dados <- {
    multas_distribuidas <- Ibamam::obter_arquivos_multas_distribuidas()
    multas_distribuidas_limpo <- Ibamam::limpar_dados(multas_distribuidas)
    id_codigos <- Ibamam::baixar_id_municipios()
    autuacoes <- Ibamam::juntar_bases(base_ibama = multas_distribuidas_limpo,
                                      base_ibgecode = id_codigos)
  }
  dados
}
