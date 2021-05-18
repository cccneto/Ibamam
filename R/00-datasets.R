#' Codigo do municipio segundo o IBGE
#'
#' Base auxiliar contendo o codigo do municipio
#'
#' @format Uma tibble, contendo:
#' \describe{
#'   \item{code_muni}{Codigo do municipio segundo o IBGE}
#'   \item{name_muni}{Nome do municipio}
#'   \item{abrev_state}{Abreviacao do estado onde o municipio esta localizado}
#' }
#' @name ibge_code
#' @keywords internal
#' @source Adaptado do pacote geobr - \url{https://github.com/ipeaGIT/geobr}
#' @examples head(ibge_code)
"ibge_code"

#' Vetor de siglas de estados brasileiros
#'
#' @name uf_abrev
#' @keywords internal
#' @source Adaptado do pacote geobr - \url{https://github.com/ipeaGIT/geobr}
#' @examples uf_abrev
"uf_abrev"
