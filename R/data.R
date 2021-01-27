
autuacoes <- load("data/df_multa_limpo_leftjoin.rda")

multas <- load("data/df_arrec_leftjoin.rda")

usethis::use_data(autuacoes, multas, overwrite = TRUE)


#' Multas Ambientais Distribuidas por Bens tutelados.
#'
#' @format Uma tibble
#' \describe{
#' \item{dataAuto}{}
#' \item{dataPagamento}{}
#' \item{municipio}{}
#' \item{numAI}{}
#' \item{tipoInfracao}{}
#' \item{ultimaAtualizacaoRelatorio}{}
#' \item{uf}{}
#' \item{tipoAuto}{}
#' \item{moeda}{}
#' \item{situacaoDebito}{}
#' \item{enquadramentoLegal}{}
#' \item{nomeRazaoSocial}{}
#' \item{cpfCnpj}{}
#' \item{valorAuto}{}
#' \item{enquadramentoJuridico}{}
#' \item{code_muni}{}
#' }
#' @name autuacoes
#' @source IBAMA - \url{https://dados.gov.br/dataset/arrecadacao-de-multas-ambientais-bens-tutelados/resource/01e0e66d-0125-4997-b2b6-cbf29bb39302}
#' @examples head(autuacoes)
#'
  "autuacoes"
#' @rdname autuacoes


#' Arrecadação de Multas Ambientais por Bens tutelados.
#'
#' @format
#' \describe{
#' \item{dataAuto}{}
#' \item{dataPagamento}{}
#' \item{municipio}{}
#' \item{valorPago}{}
#' \item{numAI}{}
#' \item{tipoInfracao}{}
#' \item{ultimaAtualizacaoRelatorio}{}
#' \item{parcela}{}
#' \item{quantidadeParcela}{}
#' \item{uf}{}
#' \item{tipoAuto}{}
#' \item{moeda}{}
#' \item{statusDebito}{}
#' \item{enquadramentoLegal}{}
#' \item{nomeRazaoSocial}{}
#' \item{cpfCnpj}{}
#' \item{valorbaseParcela}{}
#' \item{valorAuto}{}
#' \item{enquadramentoJuridico}{}
#' \item{code_muni}{}
#' }
#' @name multas
#' @source \url{https://dados.gov.br/dataset/arrecadacao-de-multas-ambientais-bens-tutelados/resource/01e0e66d-0125-4997-b2b6-cbf29bb39302}
#' @examples head(multas)
  "multas"
#' @rdname multas
