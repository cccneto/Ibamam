#' @title Realizar merging das bases
#'
#' @return a data frame
#' @param base_ibama dados baixados do ibama
#' @param base_ibgecode dados baixados do ibge
#' @keywords internal
unite_with_ibge_code <- function(base_ibama, base_ibgecode = Ibamam::ibge_code) {
  base_ibge <- base_ibgecode %>%
    tibble::add_row(name_muni =  "paraiso das aguas",
                    abrev_state = "MS",
                    code_muni = 5006275) %>%
    tibble::add_row(name_muni =  "mojui dos campos",
                    abrev_state = "PA",
                    code_muni = 1504752)

  # paraiso das aguas https://www.ibge.gov.br/cidades-e-estados/ms/paraiso-das-aguas.html
  # mojui dos campos https://www.ibge.gov.br/cidades-e-estados/pa/mojui-dos-campos.html


  dplyr::left_join(base_ibama,
    base_ibge,
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
