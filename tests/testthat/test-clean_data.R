test_that("clean_dataset() works", {
  # multas distribuidas ------------------------------
  multas_distribuidas <- get_data_of_state("CE", "distribuidas")

  multas_distribuidas_limpas <-
    multas_distribuidas %>% clean_dataset()

  # Testar a classe
  expect_s3_class(multas_distribuidas_limpas, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(multas_distribuidas_limpas), 15)

  # Testar numero de linhas
  expect_gt(nrow(multas_distribuidas_limpas), 26000)

  expect_equal(class(multas_distribuidas_limpas$dataAuto), "Date")
  expect_equal(class(multas_distribuidas_limpas$municipio), "character")
  expect_equal(class(multas_distribuidas_limpas$numAI), "character")
  expect_equal(class(multas_distribuidas_limpas$tipoInfracao), "factor")
  expect_equal(
    class(multas_distribuidas_limpas$ultimaAtualizacaoRelatorio),
    c("POSIXct", "POSIXt")
  )
  expect_equal(class(multas_distribuidas_limpas$uf), "character")
  expect_equal(class(multas_distribuidas_limpas$situacaoDebito), "character")
  expect_equal(class(multas_distribuidas_limpas$tipoAuto), "factor")
  expect_equal(class(multas_distribuidas_limpas$moeda), "factor")
  expect_equal(class(multas_distribuidas_limpas$enquadramentoLegal), "factor")
  expect_equal(class(multas_distribuidas_limpas$nomeRazaoSocial), "character")
  expect_equal(class(multas_distribuidas_limpas$cpfCnpj), "character")
  expect_equal(class(multas_distribuidas_limpas$valorAuto), "numeric")
  expect_equal(class(multas_distribuidas_limpas$enquadramentoJuridico), "factor")

  expect_equal(
    names(multas_distribuidas_limpas),
    c(
      "dataAuto", "municipio", "numAI", "tipoInfracao",
      "ultimaAtualizacaoRelatorio", "uf", "situacaoDebito", "tipoAuto",
      "moeda", "enquadramentoLegal", "nomeRazaoSocial", "cpfCnpj",
      "valorAuto", "enquadramentoJuridico", "nomeMunicipio"
    )
  )







  # multas arrecadacao
  multas_arrecadacao <- get_data_of_state("AM", "arrecadadas")
  multas_arrecadacao_limpas <-
    multas_arrecadacao %>% clean_dataset()

  # Testar a classe
  expect_s3_class(multas_arrecadacao_limpas, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(multas_arrecadacao_limpas), 20)

  # Testar numero de linhas
  expect_gt(nrow(multas_arrecadacao_limpas), 27000)

  expect_equal(class(multas_arrecadacao_limpas$dataAuto), "Date")
  expect_equal(class(multas_arrecadacao_limpas$municipio), "character")
  expect_equal(class(multas_arrecadacao_limpas$dataPagamento), "Date")
  expect_equal(class(multas_arrecadacao_limpas$valorPago), "numeric")
  expect_equal(class(multas_arrecadacao_limpas$numAI), "character")
  expect_equal(class(multas_arrecadacao_limpas$tipoInfracao), "factor")
  expect_equal(
    class(multas_arrecadacao_limpas$ultimaAtualizacaoRelatorio),
    c("POSIXct", "POSIXt")
  )
  expect_equal(class(multas_arrecadacao_limpas$parcela), "integer")
  expect_equal(class(multas_arrecadacao_limpas$quantidadeParcela), "integer")
  expect_equal(class(multas_arrecadacao_limpas$uf), "character")
  expect_equal(class(multas_arrecadacao_limpas$tipoAuto), "factor")
  expect_equal(class(multas_arrecadacao_limpas$moeda), "factor")
  expect_equal(class(multas_arrecadacao_limpas$statusDebito), "character")
  expect_equal(class(multas_arrecadacao_limpas$enquadramentoLegal), "factor")
  expect_equal(class(multas_arrecadacao_limpas$nomeRazaoSocial), "character")
  expect_equal(class(multas_arrecadacao_limpas$cpfCnpj), "character")
  expect_equal(class(multas_arrecadacao_limpas$valorbaseParcela), "numeric")
  expect_equal(class(multas_arrecadacao_limpas$valorAuto), "numeric")
  expect_equal(class(multas_arrecadacao_limpas$enquadramentoJuridico), "factor")

  expect_equal(
    names(multas_arrecadacao_limpas),
    c(
      "dataAuto", "dataPagamento", "municipio", "valorPago", "numAI", "tipoInfracao",
      "ultimaAtualizacaoRelatorio", "parcela", "quantidadeParcela", "uf", "tipoAuto",
      "moeda", "statusDebito", "enquadramentoLegal", "nomeRazaoSocial", "cpfCnpj",
      "valorbaseParcela", "valorAuto", "enquadramentoJuridico", "nomeMunicipio"
    )
  )
})
