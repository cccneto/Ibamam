#' @title Downloading data from Ibama database
#'
#' @description This function can be used to get datasets about fines applied
#' or collected by the Brazilian Institute for the Environment and Renewable
#' Natural Resources (IBAMA). This function allows to search datasets for
#' different states of Brasil, or for the whole country.
#' The resulting dataset is cleaned.
#'
#' @param dataset Which dataset to search for. Can receive one of the values:
#' for fines applied, use 'distribuidas', or
#' for fines collected, use 'arrecadadas'.
#' @param uf Abreviation of the name of the states (two letters in lower case)
#'  that data will be obtained. Default is "all", so all data from all
#'  the states of Brazil will be returned by default.
#' @param clean Whether the dataset should be cleaned or not. If TRUE, the
#' dataset will be cleaned. If FALSE, the returned dataset will be the original
#' version, without modifications. Default is TRUE.
#'
#' @return a data frame:
#' \describe{
#'   \item{dataAuto}{Date of issue of the tax assessment notice}
#'   \item{nomeMunicipio}{Name of the municipality cleaned from the original
#'    dataset. Only for `clean = TRUE`}
#'   \item{municipio}{Name of the municipality in the original dataset. Only
#'   for `clean = FALSE`}
#'   \item{nomeMunicipio_geobr}{Name of the municipality used to join with the
#'    dataset of geobr. Only for `clean = TRUE`}
#'   \item{codigoMunicipio}{IBGE code of the municipality in the dataset of
#'    geobr. Only for `clean = TRUE`}
#'   \item{dataPagamento}{Date of payment of the infraction.
#'   Only for `dataset = "arrecadadas"`}
#'   \item{valorPago}{Amount of money paid up to the date of the last update of
#'   the report. Only for `dataset = "arrecadadas"`}
#'   \item{numAI}{Identification number of the infraction notice}
#'   \item{tipoInfracao}{Type of infraction committed}
#'   \item{ultimaAtualizacaoRelatorio}{Date when the data was last updated}
#'   \item{parcela}{Installment number. Only for `dataset = "arrecadadas"`}
#'   \item{quantidadeParcela}{Total number of payments in installments.
#'   Only for `dataset = "arrecadadas"`}
#'   \item{uf}{State of the federation}
#'   \item{tipoAuto}{Category of the occurrence (Ex: fine, daily fine, warning)}
#'   \item{moeda}{Money currency used in Brazil when the }
#'   \item{statusDebito}{Monetary status of the infraction}
#'   \item{enquadramentoLegal}{Which legal device framing the infraction
#'    notice}
#'   \item{nomeRazaoSocial}{Name of the person or company that received the
#'   notice}
#'   \item{cpfCnpj}{Number of CPF or CNPJ of the person or company that received the
#'   notice}
#'   \item{valorbaseParcela}{Value of the installments for payment of the auto
#'   value. Only for `dataset = "arrecadadas"`}
#'   \item{valorAuto}{Monetary amount of the tax assessment notice}
#'   \item{enquadramentoJuridico}{Which type of document the `cpfCnpj` refears
#'    to: CPF or CNPJ. Only for `clean = TRUE`}
#' }
#'
#' @examples
#' \dontrun{
#' get_dataset_ibamam("distribuidas", "SE")
#' get_dataset_ibamam("arrecadadas", "SE")
#' }
#'
#' @export
get_dataset_ibamam <- function(dataset, uf = "all", clean = TRUE) {
  df <-  get_data_of_brazil(estados = uf, tipo_multa = dataset)

  if(clean == TRUE){
    df %>%
      clean_dataset() %>%
      unite_with_ibge_code()
  } else {
    df
  }
}
