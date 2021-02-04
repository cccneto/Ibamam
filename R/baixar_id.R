#' @title Baixar codigos municipais do IBGE
#'
#' @return a data frame
#'
#' @export
baixar_id <- function(){
  ibgecode <-
    geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
    dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
    dplyr::mutate(name_muni = stringr::str_to_lower(name_muni), # ajustando letras para maiuscula
                  name_muni = abjutils::rm_accent(name_muni), # retirando acentos
                  name_muni = stringr::str_replace_all(name_muni, "-", " "))
  ibgecode
}

# testando id_muni
# id_codigos <- baixar_id()




