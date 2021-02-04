#' @title Baixar codigos municipais do IBGE
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

id_muni <- function(){
   ibgecode <-
    geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
    dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
    dplyr::mutate(name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni), # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " "))
ibgecode
}




# testando
base_merged <- juntar_bases(base_ibama = teste, base_ibgecode = ibge)

# salvando em formato csv
# write.csv(autuacoes_teste, "data/autuacoes_teste.csv")
# write_csv(autuacoes, "data/autuacoes.csv")







