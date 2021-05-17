#' code to get municipality code from  IBGE

ibge_code <-
  geobr::lookup_muni(code_muni = 'all') %>% # puxando TODOS os municipios
  dplyr::select(code_muni, name_muni, abrev_state) %>% #selecionando variaveis de interesse
  dplyr::mutate(
    nomeMunicipio_geobr = name_muni,
    name_muni = stringr::str_to_lower(name_muni),
    # ajustando letras para maiuscula
    name_muni = abjutils::rm_accent(name_muni),
    # retirando acentos
    name_muni = stringr::str_replace_all(name_muni, "-", " ")
  )

usethis::use_data(ibge_code, overwrite = TRUE)
