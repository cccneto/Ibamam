
#' @title Downloading data from Ibama database - Multas Arrecadadas
#'
#' @return a data frame
#'
#' @export
download_multas_arrecadadas <- function(){
  dados <- {
    multas_arrecadadas <- Ibamam::obter_arquivos_arrecadacao()
    multas_arrecadadas_limpo <- Ibamam::limpar_dados(multas_arrecadadas)
    id_codigos <- Ibamam::baixar_id_municipios()
    arrecadadas <- Ibamam::juntar_bases(base_ibama = multas_arrecadadas_limpo,
                                        base_ibgecode = id_codigos)
  }
  dados
}

# multas_arrec <- download_multas_arrecadadas()
