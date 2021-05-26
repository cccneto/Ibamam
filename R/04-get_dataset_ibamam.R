#' @title Downloading data from Ibama database - Multas Arrecadadas
#'
#' @param dataset Which dataset to search for. Can receive one of the values:
#' 'arrecadadas' or 'distribuidas'
#' @param uf Abreviation of the name of the states (two letters in lower case)
#'  that data will be obtained. Default is "all", so all data from all
#'  the states of Brazil will be returned by default.
#'
#' @return a data frame
#'
#' @examples
#' get_dataset_ibamam("arrecadadas", "SE")
#' get_dataset_ibamam("distribuidas", "SE")
#'
#' @export
get_dataset_ibamam <- function(dataset, uf = "all") {
  get_data_of_brazil(estados = uf, tipo_multa = dataset) %>%
    clean_dataset() %>%
    unite_with_ibge_code()
}
