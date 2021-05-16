#' @title Downloading data from Ibama database - multas distribuidas
#'
#' @return a data frame
#'
#' @export
obter_multas_distribuidas_brasil <- function() {

  estados_abrev <- c(
    "AC",
    "AL",
    "AP",
    "AM",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO"
  )

  purrr::map_dfr(
    estados_abrev,
    obter_multas_distribuidas_estado
  )

}

#' Obter dados de multas distribuidas para um estado
#'
#' @param uf Abreviation of the name of the state (two letters in lower case)
#'
#' @return A tibble
#'
#' @export
#' @examples obter_multas_distribuidas_estado("SP")
obter_multas_distribuidas_estado <- function(uf) {
  multas_distribuidas <- jsonlite::fromJSON(
    paste0(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/",
      uf,
      "/Quantidade/multasDistribuidasBensTutelados.json"
    )
  )

  dplyr::as_tibble(multas_distribuidas$data)
}
