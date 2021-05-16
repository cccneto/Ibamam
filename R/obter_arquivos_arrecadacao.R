#' @title Downloading data from Ibama database - Multas arrecadadas
#'
#' @return A tibble
#'
#' @export
obter_arrecadacao_brasil <- function() {
  # essa funcao era obter_arquivos_arrecadacao(),
  # virou obter_arrecadacao_brasil()
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


  purrr::map_dfr(estados_abrev,
                 obter_arrecadacao_estado)

}


#' Obter dados de arrecadacao para um estado
#'
#' @param uf Abreviation of the name of the state (two letters in lower case)
#'
#' @return A tibble
#'
#' @export
#' @examples obter_arrecadacao_estado("SP")
obter_arrecadacao_estado <- function(uf) {
  multas_arrecadadas <- jsonlite::fromJSON(
    paste0(
      "http://dadosabertos.ibama.gov.br/dados/SICAFI/",
      uf,
      "/Arrecadacao/arrecadacaobenstutelados.json"
    )
  )

  dplyr::as_tibble(multas_arrecadadas$data)
}
