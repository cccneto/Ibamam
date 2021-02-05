#' @title Realizar merging das bases
#'
#' @return a data frame
#' @param base_ibama dados baixados do ibama
#' @param base_ibgecode dados baixados do ibge
#' @export
juntar_bases <- function(base_ibama, base_ibgecode){
  base_merged <- dplyr::left_join(
    base_ibama, base_ibgecode, by = c(
      "municipio" = "name_muni", "uf" = "abrev_state")
  )
  base_merged # salvando csv para realizar testes
}






