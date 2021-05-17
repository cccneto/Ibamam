test_that("unite_with_ibge_code() works", {
  # multas distribuidas ------------------------------
  multas_distribuidas <- get_data_of_state("SP", "distribuidas")

  multas_distribuidas_limpas <-
    multas_distribuidas %>% clean_dataset()

  bases_unidas_md <-
    unite_with_ibge_code(multas_distribuidas_limpas, Ibamam::ibge_code)

  # testar que nao tem NA - o join funcionou
  testthat::expect_equal(sum(is.na(bases_unidas_md$codigoMunicipio)), 0)

  # Testar a classe
  expect_s3_class(bases_unidas_md, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(bases_unidas_md), 16)

  # Testar numero de linhas
  expect_gt(nrow(bases_unidas_md), 26000)

  expect_equal(class(bases_unidas_md$dataAuto), "Date")
  expect_equal(class(bases_unidas_md$nomeMunicipio), "character")
  expect_equal(class(bases_unidas_md$nomeMunicipio_geobr), "character")
  expect_equal(class(bases_unidas_md$codigoMunicipio), "character")
  expect_equal(class(bases_unidas_md$numAI), "character")
  expect_equal(class(bases_unidas_md$tipoInfracao), "factor")
  expect_equal(
    class(bases_unidas_md$ultimaAtualizacaoRelatorio),
    c("POSIXct", "POSIXt")
  )
  expect_equal(class(bases_unidas_md$uf), "character")
  expect_equal(class(bases_unidas_md$situacaoDebito), "character")
  expect_equal(class(bases_unidas_md$tipoAuto), "factor")
  expect_equal(class(bases_unidas_md$moeda), "factor")
  expect_equal(class(bases_unidas_md$enquadramentoLegal), "factor")
  expect_equal(class(bases_unidas_md$nomeRazaoSocial), "character")
  expect_equal(class(bases_unidas_md$cpfCnpj), "character")
  expect_equal(class(bases_unidas_md$valorAuto), "numeric")
  expect_equal(class(bases_unidas_md$enquadramentoJuridico), "factor")



  # multas arrecadacao
  multas_arrecadacao <- get_data_of_state("CE", "arrecadadas")
  multas_arrecadacao_limpas <-
    multas_arrecadacao %>% clean_dataset()

  bases_unidas_a <-
    unite_with_ibge_code(multas_arrecadacao_limpas, Ibamam::ibge_code)

  # testar que nao tem NA - o join funcionou
  testthat::expect_equal(sum(is.na(bases_unidas_a$codigoMunicipio)), 0)


  # Testar a classe
  expect_s3_class(bases_unidas_a, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(bases_unidas_a), 21)

  # Testar numero de linhas
  expect_gt(nrow(bases_unidas_a), 68000)

  expect_equal(class(bases_unidas_a$dataAuto), "Date")
  expect_equal(class(bases_unidas_a$nomeMunicipio), "character")
  expect_equal(class(bases_unidas_a$nomeMunicipio_geobr), "character")
  expect_equal(class(bases_unidas_a$codigoMunicipio), "character")
  expect_equal(class(bases_unidas_a$dataPagamento), "Date")
  expect_equal(class(bases_unidas_a$valorPago), "numeric")
  expect_equal(class(bases_unidas_a$numAI), "character")
  expect_equal(class(bases_unidas_a$tipoInfracao), "factor")
  expect_equal(
    class(bases_unidas_a$ultimaAtualizacaoRelatorio),
    c("POSIXct", "POSIXt")
  )
  expect_equal(class(bases_unidas_a$parcela), "integer")
  expect_equal(class(bases_unidas_a$quantidadeParcela), "integer")
  expect_equal(class(bases_unidas_a$uf), "character")
  expect_equal(class(bases_unidas_a$tipoAuto), "factor")
  expect_equal(class(bases_unidas_a$moeda), "factor")
  expect_equal(class(bases_unidas_a$statusDebito), "character")
  expect_equal(class(bases_unidas_a$enquadramentoLegal), "factor")
  expect_equal(class(bases_unidas_a$nomeRazaoSocial), "character")
  expect_equal(class(bases_unidas_a$cpfCnpj), "character")
  expect_equal(class(bases_unidas_a$valorbaseParcela), "numeric")
  expect_equal(class(bases_unidas_a$valorAuto), "numeric")
  expect_equal(class(bases_unidas_a$enquadramentoJuridico), "factor")
})
