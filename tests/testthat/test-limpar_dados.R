test_that("limpar_dados works", {
  skip_on_cran()

  arrecadacao <- read.csv(
    system.file("extdata/test_datasets/arrecadacao.csv", package = "Ibamam")
  )
  arrecadacao_limpo <- limpar_dados(arrecadacao)

  expect_equal(names(arrecadacao_limpo),
               c("dataAuto", "dataPagamento", "municipio", "valorPago", "numAI", "tipoInfracao",
                 "ultimaAtualizacaoRelatorio", "parcela", "quantidadeParcela", "uf", "tipoAuto",
                 "moeda", "statusDebito", "enquadramentoLegal", "nomeRazaoSocial", "cpfCnpj",
                 "valorbaseParcela", "valorAuto", "enquadramentoJuridico", "nomeMunicipio")
  )

  multas_distribuidas <- read.csv(
    system.file("extdata/test_datasets/multas_distribuidas.csv", package = "Ibamam")
  )
  multas_distribuidas_limpo <- limpar_dados(multas_distribuidas)

  expect_equal(names(multas_distribuidas_limpo),
               c("dataAuto", "municipio", "numAI", "tipoInfracao",
                 "ultimaAtualizacaoRelatorio", "uf", "situacaoDebito", "tipoAuto",
                 "moeda", "enquadramentoLegal", "nomeRazaoSocial", "cpfCnpj",
                 "valorAuto", "enquadramentoJuridico", "nomeMunicipio")
  )

})
