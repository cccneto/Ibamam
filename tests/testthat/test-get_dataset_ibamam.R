test_that("get_dataset_ibamam() works", {
  # multas distribuidas ------------------------------
  multas_distribuidas <-
    get_dataset_ibamam(dataset = "distribuidas", "SP")

  # Testar a classe
  expect_s3_class(multas_distribuidas, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(multas_distribuidas), 16)

  # Testar numero de linhas
  expect_gt(nrow(multas_distribuidas), 34000)

  expect_equal(class(multas_distribuidas$dataAuto), "Date")
  expect_equal(class(multas_distribuidas$nomeMunicipio), "character")
  expect_equal(class(multas_distribuidas$nomeMunicipio_geobr),
               "character")
  expect_equal(class(multas_distribuidas$codigoMunicipio), "character")
  expect_equal(class(multas_distribuidas$numAI), "character")
  expect_equal(class(multas_distribuidas$tipoInfracao), "factor")
  expect_equal(class(multas_distribuidas$ultimaAtualizacaoRelatorio),
               c("POSIXct", "POSIXt"))
  expect_equal(class(multas_distribuidas$uf), "character")
  expect_equal(class(multas_distribuidas$situacaoDebito), "character")
  expect_equal(class(multas_distribuidas$tipoAuto), "factor")
  expect_equal(class(multas_distribuidas$moeda), "factor")
  expect_equal(class(multas_distribuidas$enquadramentoLegal), "factor")
  expect_equal(class(multas_distribuidas$nomeRazaoSocial), "character")
  expect_equal(class(multas_distribuidas$cpfCnpj), "character")
  expect_equal(class(multas_distribuidas$valorAuto), "numeric")
  expect_equal(class(multas_distribuidas$enquadramentoJuridico),
               "factor")



  # multas arrecadacao
  multas_arrecadadas <-
    get_dataset_ibamam(dataset = "arrecadadas", "CE")

  # Testar a classe
  expect_s3_class(multas_arrecadadas, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(multas_arrecadadas), 21)

  # Testar numero de linhas
  expect_gt(nrow(multas_arrecadadas), 68000)

  expect_equal(class(multas_arrecadadas$dataAuto), "Date")
  expect_equal(class(multas_arrecadadas$nomeMunicipio), "character")
  expect_equal(class(multas_arrecadadas$nomeMunicipio_geobr),
               "character")
  expect_equal(class(multas_arrecadadas$codigoMunicipio), "character")
  expect_equal(class(multas_arrecadadas$dataPagamento), "Date")
  expect_equal(class(multas_arrecadadas$valorPago), "numeric")
  expect_equal(class(multas_arrecadadas$numAI), "character")
  expect_equal(class(multas_arrecadadas$tipoInfracao), "factor")
  expect_equal(class(multas_arrecadadas$ultimaAtualizacaoRelatorio),
               c("POSIXct", "POSIXt"))
  expect_equal(class(multas_arrecadadas$parcela), "integer")
  expect_equal(class(multas_arrecadadas$quantidadeParcela), "integer")
  expect_equal(class(multas_arrecadadas$uf), "character")
  expect_equal(class(multas_arrecadadas$tipoAuto), "factor")
  expect_equal(class(multas_arrecadadas$moeda), "factor")
  expect_equal(class(multas_arrecadadas$statusDebito), "character")
  expect_equal(class(multas_arrecadadas$enquadramentoLegal), "factor")
  expect_equal(class(multas_arrecadadas$nomeRazaoSocial), "character")
  expect_equal(class(multas_arrecadadas$cpfCnpj), "character")
  expect_equal(class(multas_arrecadadas$valorbaseParcela), "numeric")
  expect_equal(class(multas_arrecadadas$valorAuto), "numeric")





  # multas distribuidas + com clean = FALSE  -------
  multas_distribuidas_untidy <-
    get_dataset_ibamam(dataset = "distribuidas", "SP",
                       clean = FALSE)

  # Testar a classe
  expect_s3_class(multas_distribuidas_untidy, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(multas_distribuidas_untidy), 13)

  # Testar numero de linhas
  expect_gt(nrow(multas_distribuidas_untidy), 34000)

  expect_equal(class(multas_distribuidas_untidy$dataAuto), "character")
  expect_equal(class(multas_distribuidas_untidy$municipio), "character")
  expect_equal(class(multas_distribuidas_untidy$numAI), "character")
  expect_equal(class(multas_distribuidas_untidy$tipoInfracao),
               "character")
  expect_equal(class(multas_distribuidas_untidy$ultimaAtualizacaoRelatorio),
               "character")
  expect_equal(class(multas_distribuidas_untidy$uf), "character")
  expect_equal(class(multas_distribuidas_untidy$situacaoDebito),
               "character")
  expect_equal(class(multas_distribuidas_untidy$tipoAuto), "character")
  expect_equal(class(multas_distribuidas_untidy$moeda), "character")
  expect_equal(class(multas_distribuidas_untidy$enquadramentoLegal),
               "character")
  expect_equal(class(multas_distribuidas_untidy$nomeRazaoSocial),
               "character")
  expect_equal(class(multas_distribuidas_untidy$cpfCnpj), "character")
  expect_equal(class(multas_distribuidas_untidy$valorAuto), "numeric")


})
