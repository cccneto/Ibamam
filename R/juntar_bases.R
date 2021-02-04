#' @title Realizar merging das bases
#'
#' @return a data frame
#'
#' @export
juntar_bases <- function(base_ibama, base_ibgecode){
  base_merged <- dplyr::left_join(
    base_ibama, base_ibgecode, by = c(
      "municipio" = "name_muni", "uf" = "abrev_state")
  )
  base_merged # salvando csv para realizar testes
}

# testando
# base_neto <- juntar_bases(base_ibama = teste, base_ibgecode = ibge)

# salvando em formato csv
# write.csv(autuacoes_teste, "data/autuacoes_teste.csv")
# write_csv(autuacoes, "data/autuacoes.csv")







