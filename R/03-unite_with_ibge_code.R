#' @title Realizar merging das bases
#'
#' @return a data frame
#' @param base_ibama dados baixados do ibama
#' @param base_ibgecode dados baixados do ibge
#' @keywords internal
unite_with_ibge_code <- function(base_ibama, base_ibgecode = Ibamam::ibge_code) {
  dplyr::left_join(base_ibama,
    base_ibgecode,
    by = c("municipio" = "name_muni", "uf" = "abrev_state")
  ) %>%
    dplyr::rename("codigoMunicipio" = code_muni) %>%
    dplyr::mutate(codigoMunicipio = as.character(codigoMunicipio)) %>%
    dplyr::relocate(nomeMunicipio,
      nomeMunicipio_geobr,
      codigoMunicipio,
      .after = dataAuto
    ) %>%
    dplyr::select(-municipio)
}
